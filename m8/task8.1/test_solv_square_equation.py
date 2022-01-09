import unittest
from solv_square_equation import validate_param, discriminant, roots, square_print


class TestPont(unittest.TestCase):
    def test_validate_param(self):
        self.assertEqual(validate_param(4.0), 4.0)
        self.assertEqual(validate_param(4), 4.0)
        self.assertEqual(validate_param(str), 4.0)

    def test_discriminant(self):
        self.assertEqual(discriminant(4, 3, 1), -7.0)
        self.assertEqual(discriminant(1, 8, 1), 60)
        self.assertEqual(discriminant(4, 4, 1), 0)

    def test_roots(self):
        self.assertEqual(roots(-7, 4, 3), [])
        self.assertEqual(roots(16, 1, -8), [6, 2])
        self.assertEqual(roots(0, 1, -6), [3])

    def test_square_print(self):
        self.assertEqual(square_print([]), None)
        self.assertEqual(square_print([6, 2]), None)
        self.assertEqual(square_print([3]), None)


