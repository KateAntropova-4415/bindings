#include "Sigmoid.h"
#include <pybind11/pybind11.h>
#include <pybind11/stl.h>

namespace py = pybind11;

PYBIND11_MODULE(sigmoid_core, m) {
    m.doc() = R"doc(
    Sigmoid for a vector.
  )doc";

    py::class_<Sigmoid>(m, "Sigmoid")
        .def_static("sigmoid_vector", &Sigmoid::sigmoid_vector, R"doc(
          Sigmoid for a Vector using pure C++.

          Parameters:
            vect : list of double.

          Returns:
            list of double
                The vector to which the Sigmoid function is applied.
      )doc");
}