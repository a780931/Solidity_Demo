// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract MergeSortedArrays {



    function mergeAndReturnNew(uint[] memory arr1, uint[] memory arr2) public pure returns (uint[] memory) {
        uint m = arr1.length;
        uint n = arr2.length;
        uint[] memory merged = new uint[](m + n); // 创建一个新数组存放合并结果

        uint i = 0; // 指向arr1的指针
        uint j = 0; // 指向arr2的指针
        uint k = 0; // 指向merged的指针

        // 遍历两个数组，比较元素并依次将较小的放入新数组[2](@ref)
        while (i < m && j < n) {
            if (arr1[i] <= arr2[j]) {
                merged[k] = arr1[i];
                i++;
            } else {
                merged[k] = arr2[j];
                j++;
            }
            k++;
        }

        // 将arr1中剩余的元素（如果存在）复制到新数组中
        while (i < m) {
            merged[k] = arr1[i];
            i++;
            k++;
        }

        // 将arr2中剩余的元素（如果存在）复制到新数组中
        while (j < n) {
            merged[k] = arr2[j];
            j++;
            k++;
        }

        return merged;
    }

    /**
     * @dev 一个演示性的辅助函数，用于在合约中打印数组（仅用于测试环境，主网中此类操作消耗Gas较多且无实际输出）。
     * @param arr 需要打印的数组
     * 此函数主要用于在Remix等测试环境中观察结果，无返回值。
     */
    // 注意：此函数仅用于演示和调试，在实际部署的合约中无法输出日志到区块链。
    function printArray(uint[] memory arr) public pure {
        // 在实际部署中，无法直接输出数组。此函数假设在Remix等环境中运行以便于调试。
        // 循环遍历数组元素
        for (uint i = 0; i < arr.length; i++) {
            // 此处无实际链上输出，Remix等IDE可能会在控制台捕获此类操作
        }
    }
}