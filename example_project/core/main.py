from example_project.data_parser.str_converter import StrConverter


def main() -> None:
    """Main script."""
    my_variable = "HELLO WORLD!"

    data_parser = StrConverter()

    print(data_parser.parse_data(my_variable))


if __name__ == "__main__":
    main()
