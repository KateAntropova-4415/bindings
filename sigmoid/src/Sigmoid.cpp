#include "Sigmoid.h"
#include<iostream>
#include<vector>
#include<cmath>

std::vector<double>Sigmoid::sigmoid_vector(const std::vector<double> &vect) {

	std::vector<double> sigmoid_vect;
	for (int i = 0; i < vect.size(); i++) {
		sigmoid_vect.push_back(1 / (1 + exp((-1) * vect[i])));
	}
	return sigmoid_vect;
}