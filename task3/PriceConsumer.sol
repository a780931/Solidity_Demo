// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceConsumer {
    AggregatorV3Interface internal priceFeed;
    // event PriceUpdated(int256 price);
    //  uint private usdPrice;

    constructor(address _aggregator) {
        priceFeed = AggregatorV3Interface(_aggregator);
    }

    function getLatestPrice() public view  returns (int256) {
        (
            ,
            int256 price,
            ,
            ,
        ) = priceFeed.latestRoundData();
        // emit PriceUpdated(price);
        return price;
    }
}