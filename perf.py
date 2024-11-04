from typing import List, Callable
import time
import numpy as np
import math
import sigmoid

def py_np_sigmoid(vec1: List[float]) -> List[float]:
    if len(vec1) < 1:
        raise ValueError("Empty vector")
    result = np.array([])
    vec1 = np.array(vec1)
    for i in range(len(vec1)):
        result = np.append(result, 1 / (1 + np.exp(-vec1[i])))
    return result

def py_math_sigmoid(vec1: List[float]) -> List[float]:
    if len(vec1) < 1:
        raise ValueError("Empty vector")
    result = []
    for i in range(len(vec1)):
        result.append(1 / (1 + math.exp(-vec1[i])))
    return result


def test_timings(func: Callable, *args):
    _ = func(*args)
    start_time = time.time()
    _ = func(*args)
    end_time = time.time()
    return round(end_time - start_time, 5)


def compare(vector_size: int) -> None:
    vector = np.random.rand(vector_size)*10
    list_a = vector.tolist()

    print(
        "Sigmoid (Math Python), size={0}: {1} seconds".format(
            vector_size, test_timings(py_math_sigmoid, list_a)
        )
    )

    print(
        "Sigmoid (Numpy Python), size={0}: {1} seconds".format(
            vector_size, test_timings(py_np_sigmoid, list_a)
        )
    )
    print(
        "Sigmoid (Cmath C++), size={0}: {1} seconds\n".format(
            vector_size, test_timings(sigmoid.Sigmoid.sigmoid_vector, list_a)
        )
    )


if __name__ == "__main__":
    for size in [10, 50, 100, 300, 500, 700]:
        compare(size)