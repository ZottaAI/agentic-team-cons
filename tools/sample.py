#!/usr/bin/env python3
"""Sampling helper for controls and audit testing.

Documents the sample basis so a reviewer can re-perform it. Two modes:

  statistical  attribute sample size from confidence + tolerable/expected deviation
  judgemental  risk-weighted size guidance by control frequency and risk

Usage:
  tools/sample.py statistical --population 5000 --confidence 95 \
      --tolerable 5 --expected 0 [--seed 42 --draw]
  tools/sample.py judgemental --frequency daily --risk high

This is a planning aid, not a substitute for the firm's sampling methodology. Always record
the population, method, size, and rationale in the workpaper.
"""
import argparse
import math
import sys

# Poisson factors (zero expected deviations) for common one-sided confidence levels.
_POISSON_ZERO = {90: 2.31, 95: 3.0, 99: 4.61}

# Indicative minimums by control frequency (illustrative; replace with firm methodology).
_FREQ_BASE = {
    "annual": 1, "quarterly": 2, "monthly": 3, "weekly": 8,
    "daily": 25, "recurring": 25, "per-transaction": 40, "continuous": 40,
}
_RISK_MULT = {"low": 1.0, "moderate": 1.25, "high": 1.5}


def statistical(args):
    f = _POISSON_ZERO.get(args.confidence)
    if f is None:
        sys.exit(f"confidence must be one of {sorted(_POISSON_ZERO)}")
    if args.tolerable <= 0:
        sys.exit("tolerable deviation rate must be > 0")
    if args.expected == 0:
        n = math.ceil(f / (args.tolerable / 100.0))
    else:
        # Simple expansion when some deviations are expected.
        n = math.ceil((f / (args.tolerable / 100.0)) *
                      (1 + args.expected / max(args.tolerable - args.expected, 1)))
    n = min(n, args.population)
    print(f"method: attribute sampling (Poisson, one-sided {args.confidence}% confidence)")
    print(f"population: {args.population}")
    print(f"tolerable deviation rate: {args.tolerable}%   expected: {args.expected}%")
    print(f"sample size: {n}")
    if args.draw:
        import random
        rng = random.Random(args.seed)
        picks = sorted(rng.sample(range(1, args.population + 1), n))
        print(f"seed: {args.seed}")
        print("selected item indices: " + ", ".join(map(str, picks)))


def judgemental(args):
    base = _FREQ_BASE.get(args.frequency)
    if base is None:
        sys.exit(f"frequency must be one of {sorted(_FREQ_BASE)}")
    mult = _RISK_MULT[args.risk]
    n = math.ceil(base * mult)
    print(f"method: judgemental, risk-weighted by control frequency")
    print(f"control frequency: {args.frequency}   risk: {args.risk}")
    print(f"indicative sample size: {n}")
    print("note: justify against firm methodology and the specific control population.")


def main():
    p = argparse.ArgumentParser(description=__doc__,
                                formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = p.add_subparsers(dest="mode", required=True)

    s = sub.add_parser("statistical")
    s.add_argument("--population", type=int, required=True)
    s.add_argument("--confidence", type=int, default=95, choices=sorted(_POISSON_ZERO))
    s.add_argument("--tolerable", type=float, required=True, help="tolerable deviation rate %")
    s.add_argument("--expected", type=float, default=0.0, help="expected deviation rate %")
    s.add_argument("--draw", action="store_true", help="also draw the sample indices")
    s.add_argument("--seed", type=int, default=42)
    s.set_defaults(func=statistical)

    j = sub.add_parser("judgemental")
    j.add_argument("--frequency", required=True, choices=sorted(_FREQ_BASE))
    j.add_argument("--risk", default="moderate", choices=sorted(_RISK_MULT))
    j.set_defaults(func=judgemental)

    args = p.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
