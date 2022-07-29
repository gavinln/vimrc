"""
python argparse-example.py -h
python argparse-example.py --debug
python argparse-example.py circle -h
python argparse-example.py rectangle -h

python argparse-example.py --debug circle 3
python argparse-example.py --debug rectangle 3 4

python argparse-example.py --equation circle 3
python argparse-example.py --equation rectangle 3 4

python python/argparse-example.py --equation circle 3 --bounding_box

https://www.travisluong.com/advanced-python-using-decorators-argparse-and-inspect-to-build-fastarg-a-command-line-argument-parser-library/
"""

import argparse
import math

import inspect
from inspect import signature
from functools import wraps


parser = argparse.ArgumentParser(
    prog="argparse-example", description="area of a shape"
)
parser.add_argument("--debug", action="store_true", help="Print debug info")
parser.add_argument("--equation", action="store_true", help="Display equation")
subparsers = parser.add_subparsers(dest="shape", help="subparser help")


def main(command_line=None):
    parser = argparse.ArgumentParser(
        prog="argparse-example", description="area of a shape"
    )
    parser.add_argument(
        "--debug", action="store_true", help="Print debug info"
    )
    parser.add_argument(
        "--equation", action="store_true", help="Display equation"
    )

    subparsers = parser.add_subparsers(dest="shape")
    circle = subparsers.add_parser("circle", help="area of a circle")
    circle.add_argument("radius", type=int, help="radius of the circle")
    circle.add_argument(
        "--bounding_box", action="store_true", help="show bounding box"
    )

    rectangle = subparsers.add_parser("rectangle", help="area of a rectangle")
    rectangle.add_argument("length", type=int, help="length of a rectangle")
    rectangle.add_argument("breadth", type=int, help="breadth of a rectangle")

    args = parser.parse_args(command_line)
    if args.debug:
        print("debug: " + str(args))
    if args.shape == "circle":
        print(
            "area of a {} = {}".format(
                args.shape, math.pi * args.radius * args.radius
            )
        )
        if args.equation:
            print("area = pi * radius * radius")
        if args.bounding_box:
            print("bounding box = {0} x {0}".format(args.radius * 2))
    elif args.shape == "rectangle":
        print(
            "area of a {} = {}".format(args.shape, args.length * args.breadth)
        )
        if args.equation:
            print("area = length * breadth")


def cli(func):
    subparser = subparsers.add_parser(func.__name__, help=func.__doc__)
    sig = signature(func)
    func_args = []
    for name, param in sig.parameters.items():
        # print(param.kind, ":", name, "=", param.default)
        if name == "args":
            continue

        func_args.append(name)
        annotation = param.annotation
        if annotation is bool:
            action = argparse.BooleanOptionalAction
        else:
            action = None

        if param.default is inspect._empty:
            arg_name = name
            subparser.add_argument(
                arg_name,
                type=annotation,
                help=f"type: {annotation.__name__}",
                default=param.default,
                action=action,
            )
        else:
            arg_name = "--" + name
            subparser.add_argument(
                arg_name,
                type=annotation,
                help=f"type: {annotation.__name__}",
                default=param.default,
                action=action,
            )

    @wraps(func)
    def wrapped(*args, **kwargs):
        new_args = parser.parse_args()
        new_args_dict = dict(new_args._get_kwargs())
        new_kwargs = {key: new_args_dict[key] for key in func_args}
        func(new_args, **new_kwargs)

    return wrapped


@cli
def circle(args: argparse.Namespace, radius: int, bounding_box: bool = False):
    "area of a circle"
    if args.debug:
        print("debug: " + str(args))
    print(
        "area of a {} = {}".format(
            args.shape, math.pi * args.radius * args.radius
        )
    )
    if args.equation:
        print("area = pi * radius * radius")
    if bounding_box:
        print("bounding box = {0} x {0}".format(radius * 2))


@cli
def rectangle(args: argparse.Namespace, length: int, breadth: int):
    "area of a rectangle"
    if args.debug:
        print("debug: " + str(args))
    print("area of a {} = {}".format(args.shape, args.length * args.breadth))
    if args.equation:
        print("area = length * breadth")


def main2():
    args = parser.parse_args()
    if args.shape:
        func = globals()[args.shape]
        func()


if __name__ == "__main__":
    main()
    # main2()
