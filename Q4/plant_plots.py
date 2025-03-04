import argparse
import matplotlib.pyplot as plt
import pandas as pd

# הגדרת פרמטרים מהטרמינל
parser = argparse.ArgumentParser()
parser.add_argument("--plant", type=str, required=True, help="Plant name")
parser.add_argument("--height", nargs='+', type=float, required=True, help="List of heights")
parser.add_argument("--leaf_count", nargs='+', type=int, required=True, help="List of leaf counts")
parser.add_argument("--dry_weight", nargs='+', type=float, required=True, help="List of dry weights")
args = parser.parse_args()

# יצירת גרפים
plt.figure(figsize=(10, 5))

plt.subplot(1, 3, 1)
plt.plot(args.height, label="Height")
plt.title(f"{args.plant} - Height")
plt.xlabel("Time")
plt.ylabel("Height (cm)")
plt.legend()

plt.subplot(1, 3, 2)
plt.plot(args.leaf_count, label="Leaf Count", color='green')
plt.title(f"{args.plant} - Leaf Count")
plt.xlabel("Time")
plt.ylabel("Number of Leaves")
plt.legend()

plt.subplot(1, 3, 3)
plt.plot(args.dry_weight, label="Dry Weight", color='red')
plt.title(f"{args.plant} - Dry Weight")
plt.xlabel("Time")
plt.ylabel("Weight (grams)")
plt.legend()

plt.tight_layout()
plt.savefig(f"Q4_1/{args.plant}_plots.png")
plt.show()
