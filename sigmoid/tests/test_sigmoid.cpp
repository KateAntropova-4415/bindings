#include "Sigmoid.h"
#include <gtest/gtest.h>
#include <cmath>

TEST(Sigmoid, SigmoidForVector) {
	std::vector<double> a = { 1.0, 2.0, 3.0, 4.0, 5.0 };
	auto result = Sigmoid::sigmoid_vector(a);
	EXPECT_DOUBLE_EQ(round(result[0]*1000000)/1000000, 0.731059);
	EXPECT_DOUBLE_EQ(round(result[1]*1000000)/1000000, 0.880797);
	EXPECT_DOUBLE_EQ(round(result[2]*1000000)/1000000, 0.952574);
	EXPECT_DOUBLE_EQ(round(result[3]*1000000)/1000000, 0.982014);
	EXPECT_DOUBLE_EQ(round(result[4]*1000000)/1000000, 0.993307);
}

int main(int argc, char** argv) {
	::testing::InitGoogleTest(&argc, argv);
	return RUN_ALL_TESTS();
}