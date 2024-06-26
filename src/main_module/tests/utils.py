from importlib import import_module


def add_to(test_suite, method_name=None):

    def wrapper(cls):
        for test_method in {m for m in dir(cls) if m.startswith("test_")}:
            test_suite.addTest(cls(test_method))
        if method_name is not None:
            setattr(cls, "_method", method_name)
        return cls

    return wrapper


def def_load_tests(module_path):

    def load_tests(loader, tests, ignore):
        from doctest import DocTestSuite

        tests.addTests(DocTestSuite(import_module(module_path)))
        return tests

    return load_tests
