// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 引入 OpenZeppelin 的 ERC721 实现、元数据扩展、计数器工具和权限管理
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title MyNFT
 * @dev 一个支持唯一元数据URI、自动递增tokenId的ERC721合约示例
 * 继承自 ERC721, ERC721URIStorage 和 Ownable
 */
contract MyNFT is ERC721, ERC721URIStorage, Ownable {
    // 使用 OpenZeppelin 的 Counters 库来安全地管理 tokenId
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter; // 当前令牌计数器


    constructor()
    ERC721("MyNFT", "MNFT")
    Ownable(msg.sender) // 直接将部署者设为所有者
    {}
    /**
     * @dev 公开的铸造函数，允许合约所有者给特定地址铸造一个新的NFT
     * @param to NFT接收者的地址
     * @param tokenURI 指向该NFT元数据JSON文件的URI（通常存储在IPFS等去中心化存储上）
     * @return 新铸造的NFT的tokenId
     */
    function safeMint(address to, string memory tokenURI) public onlyOwner returns (uint256) {
        // 增加计数器并获取新的tokenId
        _tokenIdCounter.increment();
        uint256 newTokenId = _tokenIdCounter.current();

        // 使用安全铸造（内部会检查接收地址）
        _safeMint(to, newTokenId);
        // 设置该tokenId对应的元数据URI
        _setTokenURI(newTokenId, tokenURI);

        return newTokenId;
    }

    // 以下函数是由于继承冲突而必须进行的重写

    /**
     * @dev 销毁指定tokenId的NFT。重写函数以解决继承冲突。
     * @param tokenId 要销毁的NFT的tokenId
     */
    // function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
    //     super._burn(tokenId);
    // }

    /**
     * @dev 查询指定tokenId对应的元数据URI。重写函数以解决继承冲突。
     * @param tokenId 要查询的NFT的tokenId
     * @return 该NFT的元数据URI
     */
    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    /**
     * @dev 检查合约是否支持某个接口。重写函数以解决继承冲突。
     * @param interfaceId 要查询的接口ID
     * @return 是否支持该接口
     */
    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}