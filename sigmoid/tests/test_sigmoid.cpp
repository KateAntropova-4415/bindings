#include "Sigmoid.h"
#include <gtest/gtest.h>

TEST(Sigmoid, SigmoidForVector) {
	std::vector<double> a = { 1.0, 2.0, 3.0, 4.0, 5.0 };
	auto result = Sigmoid::sigmoid_vector(a);
	EXPECT_DOUBLE_EQ(result[0], 0.731059);
	EXPECT_DOUBLE_EQ(result[1], 0.880797);
	EXPECT_DOUBLE_EQ(result[2], 0.952574);
	EXPECT_DOUBLE_EQ(result[3], 0.982014);
	EXPECT_DOUBLE_EQ(result[4], 0.993307);
}

int main(int argc, char** argv) {
	::testing::InitGoogleTest(&argc, argv);
	return RUN_ALL_TESTS();
}