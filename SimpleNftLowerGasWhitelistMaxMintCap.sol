{\rtf1\ansi\ansicpg1252\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;\f1\fnil\fcharset0 .AppleSystemUIFontMonospaced-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red255\green255\blue255;\red79\green122\blue60;
\red173\green173\blue193;\red72\green139\blue206;\red213\green213\blue212;\red167\green197\blue151;\red194\green125\blue100;
\red186\green96\blue42;\red45\green175\blue118;\red238\green114\blue172;\red18\green113\blue150;\red31\green132\blue63;
\red250\green178\blue11;\red138\green106\blue9;\red17\green92\blue168;\red116\green124\blue132;\red255\green255\blue255;
\red91\green100\blue110;\red15\green67\blue159;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c100000\c100000\c99985\c0;\cssrgb\c37531\c54377\c30251;
\cssrgb\c73295\c73703\c80096;\cssrgb\c34356\c61927\c84545;\cssrgb\c86559\c86558\c86234;\cssrgb\c71061\c80852\c65647;\cssrgb\c80765\c56762\c46655;
\cssrgb\c78523\c45445\c21621;\cssrgb\c19542\c72957\c53596;\cssrgb\c95369\c54139\c73069;\cssrgb\c3778\c51769\c65301;\cssrgb\c12716\c57859\c31437;
\cssrgb\c98989\c74441\c1126;\cssrgb\c61329\c48639\c2133;\cssrgb\c5149\c44524\c71621;\cssrgb\c52790\c55943\c58882;\cssrgb\c100000\c100000\c100000\c0;
\cssrgb\c43288\c46829\c50643;\cssrgb\c5322\c34835\c68448;}
\margl1440\margr1440\vieww17580\viewh14940\viewkind0
\deftab720
\pard\pardeftab720\sl360\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 // SPDX-License-Identifier: MIT\cb3 \strokec5 \
\
\cb3 \strokec4 // Amended by HashLips\cb3 \strokec5 \
\cb3 \strokec4 /**\cb3 \strokec5 \
\cb3 \strokec4     !Disclaimer!\cb3 \strokec5 \
\cb3 \strokec4     These contracts have been used to create tutorials,\cb3 \strokec5 \
\cb3 \strokec4     and was created for the purpose to teach people\cb3 \strokec5 \
\cb3 \strokec4     how to create smart contracts on the blockchain.\cb3 \strokec5 \
\cb3 \strokec4     please review this code on your own before using any of\cb3 \strokec5 \
\cb3 \strokec4     the following code for production.\cb3 \strokec5 \
\cb3 \strokec4     The developer will not be responsible or liable for all loss or \cb3 \strokec5 \
\cb3 \strokec4     damage whatsoever caused by you participating in any way in the \cb3 \strokec5 \
\cb3 \strokec4     experimental code, whether putting money into the contract or \cb3 \strokec5 \
\cb3 \strokec4     using the code for your own project.\cb3 \strokec5 \
\cb3 \strokec4 */\cb3 \strokec5 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec6 pragma\cb3 \strokec5  \cb3 \strokec6 solidity\cb3 \strokec5  \cb3 \strokec7 >=\cb3 \strokec8 0.7.0\cb3 \strokec5  \cb3 \strokec7 <\cb3 \strokec8 0.9.0\cb3 \strokec7 ;\cb3 \strokec5 \
\
\cb3 \strokec6 import\cb3 \strokec5  \cb3 \strokec9 "@openzeppelin/contracts/token/ERC721/ERC721.sol"\cb3 \strokec7 ;\cb3 \strokec5 \
\cb3 \strokec6 import\cb3 \strokec5  \cb3 \strokec9 "@openzeppelin/contracts/utils/Counters.sol"\cb3 \strokec7 ;\cb3 \strokec5 \
\cb3 \strokec6 import\cb3 \strokec5  \cb3 \strokec9 "@openzeppelin/contracts/access/Ownable.sol"\cb3 \strokec7 ;\cb3 \strokec5 \
\
\cb3 \strokec6 contract\cb3 \strokec5  SimpleNftLowerGas \cb3 \strokec6 is\cb3 \strokec5  ERC721\cb3 \strokec7 ,\cb3 \strokec5  Ownable \cb3 \strokec7 \{\cb3 \strokec5 \
  \cb3 \strokec6 using\cb3 \strokec5  Strings \cb3 \strokec10 for\cb3 \strokec5  \cb3 \strokec6 uint256\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec6 using\cb3 \strokec5  Counters \cb3 \strokec10 for\cb3 \strokec5  Counters\cb3 \strokec7 .\cb3 \strokec5 Counter\cb3 \strokec7 ;\cb3 \strokec5 \
\
  Counters\cb3 \strokec7 .\cb3 \strokec5 Counter \cb3 \strokec11 private\cb3 \strokec5  supply\cb3 \strokec7 ;\cb3 \strokec5 \
\
  \cb3 \strokec6 string\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  uriPrefix \cb3 \strokec7 =\cb3 \strokec5  \cb3 \strokec9 ""\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec6 string\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  uriSuffix \cb3 \strokec7 =\cb3 \strokec5  \cb3 \strokec9 ".json"\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec6 string\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  hiddenMetadataUri\cb3 \strokec7 ;\cb3 \strokec5 \
  \
  \cb3 \strokec6 uint256\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  cost \cb3 \strokec7 =\cb3 \strokec5  \cb3 \strokec8 0.069\cb3 \strokec5  ether\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec6 uint256\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  maxSupply \cb3 \strokec7 =\cb3 \strokec5  \cb3 \strokec8 69\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec6 uint256\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  maxMintAmountPerTx \cb3 \strokec7 =\cb3 \strokec5  \cb3 \strokec8 1\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec6 uint256\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  nftPerAddressLimit \cb3 \strokec7 =\cb3 \strokec5  \cb3 \strokec8 1\cb3 \strokec7 ;\cb3 \strokec5 \
  \
\
  \cb3 \strokec6 bool\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  paused \cb3 \strokec7 =\cb3 \strokec5  \cb3 \strokec6 true\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec6 bool\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  revealed \cb3 \strokec7 =\cb3 \strokec5  \cb3 \strokec6 false\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec6 bool\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  onlyWhitelisted \cb3 \strokec7 =\cb3 \strokec5  \cb3 \strokec6 true\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec6 address\cb3 \strokec7 []\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  whitelistedAddresses\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec6 mapping\cb3 \strokec7 (\cb3 \strokec6 address\cb3 \strokec5  => \cb3 \strokec6 uint256\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  addressMintedBalance\cb3 \strokec7 ;\cb3 \strokec5 \
\
  \cb3 \strokec12 constructor\cb3 \strokec7 ()\cb3 \strokec5  ERC721\cb3 \strokec7 (\cb3 \strokec9 "NAME"\cb3 \strokec7 ,\cb3 \strokec5  \cb3 \strokec9 "SYMBOL"\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec7 \{\cb3 \strokec5 \
    setHiddenMetadataUri\cb3 \strokec7 (\cb3 \strokec9 "ipfs://QmSMqbQffhTwd3SMwuVTFHhx2aRPrUbsK7G8aMXdwNJJaC/prereveal.json"\cb3 \strokec7 );\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 modifier\cb3 \strokec5  mintCompliance\cb3 \strokec7 (\cb3 \strokec6 uint256\cb3 \strokec5  _mintAmount\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec7 \{\cb3 \strokec5 \
    \cb3 \strokec13 require\cb3 \strokec7 (\cb3 \strokec5 _mintAmount \cb3 \strokec7 >\cb3 \strokec5  \cb3 \strokec8 0\cb3 \strokec5  \cb3 \strokec7 &&\cb3 \strokec5  _mintAmount \cb3 \strokec7 <=\cb3 \strokec5  maxMintAmountPerTx\cb3 \strokec7 ,\cb3 \strokec5  \cb3 \strokec9 "Invalid mint amount!"\cb3 \strokec7 );\cb3 \strokec5 \
    \cb3 \strokec13 require\cb3 \strokec7 (\cb3 \strokec5 supply\cb3 \strokec7 .\cb3 \strokec5 current\cb3 \strokec7 ()\cb3 \strokec5  \cb3 \strokec7 +\cb3 \strokec5  _mintAmount \cb3 \strokec7 <=\cb3 \strokec5  maxSupply\cb3 \strokec7 ,\cb3 \strokec5  \cb3 \strokec9 "Max supply exceeded!"\cb3 \strokec7 );\cb3 \strokec5 \
    _\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 function\cb3 \strokec5  totalSupply\cb3 \strokec7 ()\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  \cb3 \strokec11 view\cb3 \strokec5  \cb3 \strokec14 returns\cb3 \strokec5  \cb3 \strokec7 (\cb3 \strokec6 uint256\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec7 \{\cb3 \strokec5 \
    \cb3 \strokec14 return\cb3 \strokec5  supply\cb3 \strokec7 .\cb3 \strokec5 current\cb3 \strokec7 ();\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 function\cb3 \strokec5  mint\cb3 \strokec7 (\cb3 \strokec6 uint256\cb3 \strokec5  _mintAmount\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  \cb3 \strokec11 payable\cb3 \strokec5  mintCompliance\cb3 \strokec7 (\cb3 \strokec5 _mintAmount\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec7 \{\cb3 \strokec5 \
    \cb3 \strokec13 require\cb3 \strokec7 (!\cb3 \strokec5 paused\cb3 \strokec7 ,\cb3 \strokec5  \cb3 \strokec9 "The contract is paused!"\cb3 \strokec7 );\cb3 \strokec5 \
    \cb3 \strokec13 require\cb3 \strokec7 (\cb3 \strokec13 msg\cb3 \strokec7 .\cb3 \strokec5 value \cb3 \strokec7 >=\cb3 \strokec5  cost \cb3 \strokec7 *\cb3 \strokec5  _mintAmount\cb3 \strokec7 ,\cb3 \strokec5  \cb3 \strokec9 "Insufficient funds!"\cb3 \strokec7 );\cb3 \strokec5 \
\
    _mintLoop\cb3 \strokec7 (\cb3 \strokec13 msg\cb3 \strokec7 .\cb3 \strokec5 sender\cb3 \strokec7 ,\cb3 \strokec5  _mintAmount\cb3 \strokec7 );\cb3 \strokec5 \
\
    \cb3 \strokec15 if\cb3 \strokec5  \cb3 \strokec7 (\cb3 \strokec13 msg\cb3 \strokec7 .\cb3 \strokec5 sender \cb3 \strokec7 !=\cb3 \strokec5  owner\cb3 \strokec7 ())\cb3 \strokec5  \cb3 \strokec7 \{\cb3 \strokec5 \
        \cb3 \strokec15 if\cb3 \strokec7 (\cb3 \strokec5 onlyWhitelisted \cb3 \strokec7 ==\cb3 \strokec5  \cb3 \strokec6 true\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec7 \{\cb3 \strokec5 \
            \cb3 \strokec13 require\cb3 \strokec7 (\cb3 \strokec5 isWhitelisted\cb3 \strokec7 (\cb3 \strokec13 msg\cb3 \strokec7 .\cb3 \strokec5 sender\cb3 \strokec7 ),\cb3 \strokec5  \cb3 \strokec9 "user is not whitelisted"\cb3 \strokec7 );\cb3 \strokec5 \
            \cb3 \strokec6 uint256\cb3 \strokec5  ownerMintedCount \cb3 \strokec7 =\cb3 \strokec5  addressMintedBalance\cb3 \strokec7 [\cb3 \strokec13 msg\cb3 \strokec7 .\cb3 \strokec5 sender\cb3 \strokec7 ];\cb3 \strokec5 \
            \cb3 \strokec13 require\cb3 \strokec7 (\cb3 \strokec5 ownerMintedCount \cb3 \strokec7 +\cb3 \strokec5  _mintAmount \cb3 \strokec7 <=\cb3 \strokec5  nftPerAddressLimit\cb3 \strokec7 ,\cb3 \strokec5  \cb3 \strokec9 "max NFT per address exceeded"\cb3 \strokec7 );\cb3 \strokec5 \
        \cb3 \strokec7 \}\cb3 \strokec5 \
        \cb3 \strokec13 require\cb3 \strokec7 (\cb3 \strokec13 msg\cb3 \strokec7 .\cb3 \strokec5 value \cb3 \strokec7 >=\cb3 \strokec5  cost \cb3 \strokec7 *\cb3 \strokec5  _mintAmount\cb3 \strokec7 ,\cb3 \strokec5  \cb3 \strokec9 "insufficient funds"\cb3 \strokec7 );\cb3 \strokec5 \
    \cb3 \strokec7 \}\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
  \
  \cb3 \strokec6 function\cb3 \strokec5  isWhitelisted\cb3 \strokec7 (\cb3 \strokec6 address\cb3 \strokec5  _user\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  \cb3 \strokec11 view\cb3 \strokec5  \cb3 \strokec14 returns\cb3 \strokec5  \cb3 \strokec7 (\cb3 \strokec6 bool\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec7 \{\cb3 \strokec5 \
    \cb3 \strokec10 for\cb3 \strokec5  \cb3 \strokec7 (\cb3 \strokec6 uint\cb3 \strokec5  i \cb3 \strokec7 =\cb3 \strokec5  \cb3 \strokec8 0\cb3 \strokec7 ;\cb3 \strokec5  i \cb3 \strokec7 <\cb3 \strokec5  whitelistedAddresses\cb3 \strokec7 .\cb3 \strokec5 length\cb3 \strokec7 ;\cb3 \strokec5  i\cb3 \strokec7 ++)\cb3 \strokec5  \cb3 \strokec7 \{\cb3 \strokec5 \
      \cb3 \strokec15 if\cb3 \strokec5  \cb3 \strokec7 (\cb3 \strokec5 whitelistedAddresses\cb3 \strokec7 [\cb3 \strokec5 i\cb3 \strokec7 ]\cb3 \strokec5  \cb3 \strokec7 ==\cb3 \strokec5  _user\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec7 \{\cb3 \strokec5 \
          \cb3 \strokec14 return\cb3 \strokec5  \cb3 \strokec6 true\cb3 \strokec7 ;\cb3 \strokec5 \
      \cb3 \strokec7 \}\cb3 \strokec5 \
    \cb3 \strokec7 \}\cb3 \strokec5 \
    \cb3 \strokec14 return\cb3 \strokec5  \cb3 \strokec6 false\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
  \
  \cb3 \strokec6 function\cb3 \strokec5  mintForAddress\cb3 \strokec7 (\cb3 \strokec6 uint256\cb3 \strokec5  _mintAmount\cb3 \strokec7 ,\cb3 \strokec5  \cb3 \strokec6 address\cb3 \strokec5  _receiver\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  mintCompliance\cb3 \strokec7 (\cb3 \strokec5 _mintAmount\cb3 \strokec7 )\cb3 \strokec5  onlyOwner \cb3 \strokec7 \{\cb3 \strokec5 \
    _mintLoop\cb3 \strokec7 (\cb3 \strokec5 _receiver\cb3 \strokec7 ,\cb3 \strokec5  _mintAmount\cb3 \strokec7 );\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 function\cb3 \strokec5  walletOfOwner\cb3 \strokec7 (\cb3 \strokec6 address\cb3 \strokec5  _owner\cb3 \strokec7 )\cb3 \strokec5 \
    \cb3 \strokec11 public\cb3 \strokec5 \
    \cb3 \strokec11 view\cb3 \strokec5 \
    \cb3 \strokec14 returns\cb3 \strokec5  \cb3 \strokec7 (\cb3 \strokec6 uint256\cb3 \strokec7 []\cb3 \strokec5  \cb3 \strokec16 memory\cb3 \strokec7 )\cb3 \strokec5 \
  \cb3 \strokec7 \{\cb3 \strokec5 \
    \cb3 \strokec6 uint256\cb3 \strokec5  ownerTokenCount \cb3 \strokec7 =\cb3 \strokec5  balanceOf\cb3 \strokec7 (\cb3 \strokec5 _owner\cb3 \strokec7 );\cb3 \strokec5 \
    \cb3 \strokec6 uint256\cb3 \strokec7 []\cb3 \strokec5  \cb3 \strokec16 memory\cb3 \strokec5  ownedTokenIds \cb3 \strokec7 =\cb3 \strokec5  \cb3 \strokec6 new\cb3 \strokec5  \cb3 \strokec6 uint256\cb3 \strokec7 [](\cb3 \strokec5 ownerTokenCount\cb3 \strokec7 );\cb3 \strokec5 \
    \cb3 \strokec6 uint256\cb3 \strokec5  currentTokenId \cb3 \strokec7 =\cb3 \strokec5  \cb3 \strokec8 1\cb3 \strokec7 ;\cb3 \strokec5 \
    \cb3 \strokec6 uint256\cb3 \strokec5  ownedTokenIndex \cb3 \strokec7 =\cb3 \strokec5  \cb3 \strokec8 0\cb3 \strokec7 ;\cb3 \strokec5 \
\
    \cb3 \strokec10 while\cb3 \strokec5  \cb3 \strokec7 (\cb3 \strokec5 ownedTokenIndex \cb3 \strokec7 <\cb3 \strokec5  ownerTokenCount \cb3 \strokec7 &&\cb3 \strokec5  currentTokenId \cb3 \strokec7 <=\cb3 \strokec5  maxSupply\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec7 \{\cb3 \strokec5 \
      \cb3 \strokec6 address\cb3 \strokec5  currentTokenOwner \cb3 \strokec7 =\cb3 \strokec5  ownerOf\cb3 \strokec7 (\cb3 \strokec5 currentTokenId\cb3 \strokec7 );\cb3 \strokec5 \
\
      \cb3 \strokec15 if\cb3 \strokec5  \cb3 \strokec7 (\cb3 \strokec5 currentTokenOwner \cb3 \strokec7 ==\cb3 \strokec5  _owner\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec7 \{\cb3 \strokec5 \
        ownedTokenIds\cb3 \strokec7 [\cb3 \strokec5 ownedTokenIndex\cb3 \strokec7 ]\cb3 \strokec5  \cb3 \strokec7 =\cb3 \strokec5  currentTokenId\cb3 \strokec7 ;\cb3 \strokec5 \
\
        ownedTokenIndex\cb3 \strokec7 ++;\cb3 \strokec5 \
      \cb3 \strokec7 \}\cb3 \strokec5 \
\
      currentTokenId\cb3 \strokec7 ++;\cb3 \strokec5 \
    \cb3 \strokec7 \}\cb3 \strokec5 \
\
    \cb3 \strokec14 return\cb3 \strokec5  ownedTokenIds\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 function\cb3 \strokec5  tokenURI\cb3 \strokec7 (\cb3 \strokec6 uint256\cb3 \strokec5  _tokenId\cb3 \strokec7 )\cb3 \strokec5 \
    \cb3 \strokec11 public\cb3 \strokec5 \
    \cb3 \strokec11 view\cb3 \strokec5 \
    \cb3 \strokec17 virtual\cb3 \strokec5 \
    \cb3 \strokec18 override\cb3 \strokec5 \
    \cb3 \strokec14 returns\cb3 \strokec5  \cb3 \strokec7 (\cb3 \strokec6 string\cb3 \strokec5  \cb3 \strokec16 memory\cb3 \strokec7 )\cb3 \strokec5 \
  \cb3 \strokec7 \{\cb3 \strokec5 \
    \cb3 \strokec13 require\cb3 \strokec7 (\cb3 \strokec5 \
      _exists\cb3 \strokec7 (\cb3 \strokec5 _tokenId\cb3 \strokec7 ),\cb3 \strokec5 \
      \cb3 \strokec9 "ERC721Metadata: URI query for nonexistent token"\cb3 \strokec5 \
    \cb3 \strokec7 );\cb3 \strokec5 \
\
    \cb3 \strokec15 if\cb3 \strokec5  \cb3 \strokec7 (\cb3 \strokec5 revealed \cb3 \strokec7 ==\cb3 \strokec5  \cb3 \strokec6 false\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec7 \{\cb3 \strokec5 \
      \cb3 \strokec14 return\cb3 \strokec5  hiddenMetadataUri\cb3 \strokec7 ;\cb3 \strokec5 \
    \cb3 \strokec7 \}\cb3 \strokec5 \
\
    \cb3 \strokec6 string\cb3 \strokec5  \cb3 \strokec16 memory\cb3 \strokec5  currentBaseURI \cb3 \strokec7 =\cb3 \strokec5  _baseURI\cb3 \strokec7 ();\cb3 \strokec5 \
    \cb3 \strokec14 return\cb3 \strokec5  \cb3 \strokec13 bytes\cb3 \strokec7 (\cb3 \strokec5 currentBaseURI\cb3 \strokec7 ).\cb3 \strokec5 length \cb3 \strokec7 >\cb3 \strokec5  \cb3 \strokec8 0\cb3 \strokec5 \
        \cb3 \strokec7 ?\cb3 \strokec5  \cb3 \strokec6 string\cb3 \strokec7 (\cb3 \strokec13 abi\cb3 \strokec7 .\cb3 \strokec5 encodePacked\cb3 \strokec7 (\cb3 \strokec5 currentBaseURI\cb3 \strokec7 ,\cb3 \strokec5  _tokenId\cb3 \strokec7 .\cb3 \strokec5 toString\cb3 \strokec7 (),\cb3 \strokec5  uriSuffix\cb3 \strokec7 ))\cb3 \strokec5 \
        \cb3 \strokec7 :\cb3 \strokec5  \cb3 \strokec9 ""\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 function\cb3 \strokec5  setRevealed\cb3 \strokec7 (\cb3 \strokec6 bool\cb3 \strokec5  _state\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  onlyOwner \cb3 \strokec7 \{\cb3 \strokec5 \
    revealed \cb3 \strokec7 =\cb3 \strokec5  _state\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 function\cb3 \strokec5  setNftPerAddressLimit\cb3 \strokec7 (\cb3 \strokec6 uint256\cb3 \strokec5  _limit\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  onlyOwner \cb3 \strokec7 \{\cb3 \strokec5 \
    nftPerAddressLimit \cb3 \strokec7 =\cb3 \strokec5  _limit\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 function\cb3 \strokec5  setCost\cb3 \strokec7 (\cb3 \strokec6 uint256\cb3 \strokec5  _cost\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  onlyOwner \cb3 \strokec7 \{\cb3 \strokec5 \
    cost \cb3 \strokec7 =\cb3 \strokec5  _cost\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 function\cb3 \strokec5  setMaxMintAmountPerTx\cb3 \strokec7 (\cb3 \strokec6 uint256\cb3 \strokec5  _maxMintAmountPerTx\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  onlyOwner \cb3 \strokec7 \{\cb3 \strokec5 \
    maxMintAmountPerTx \cb3 \strokec7 =\cb3 \strokec5  _maxMintAmountPerTx\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 function\cb3 \strokec5  setHiddenMetadataUri\cb3 \strokec7 (\cb3 \strokec6 string\cb3 \strokec5  \cb3 \strokec16 memory\cb3 \strokec5  _hiddenMetadataUri\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  onlyOwner \cb3 \strokec7 \{\cb3 \strokec5 \
    hiddenMetadataUri \cb3 \strokec7 =\cb3 \strokec5  _hiddenMetadataUri\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 function\cb3 \strokec5  setUriPrefix\cb3 \strokec7 (\cb3 \strokec6 string\cb3 \strokec5  \cb3 \strokec16 memory\cb3 \strokec5  _uriPrefix\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  onlyOwner \cb3 \strokec7 \{\cb3 \strokec5 \
    uriPrefix \cb3 \strokec7 =\cb3 \strokec5  _uriPrefix\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 function\cb3 \strokec5  setUriSuffix\cb3 \strokec7 (\cb3 \strokec6 string\cb3 \strokec5  \cb3 \strokec16 memory\cb3 \strokec5  _uriSuffix\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  onlyOwner \cb3 \strokec7 \{\cb3 \strokec5 \
    uriSuffix \cb3 \strokec7 =\cb3 \strokec5  _uriSuffix\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 function\cb3 \strokec5  setPaused\cb3 \strokec7 (\cb3 \strokec6 bool\cb3 \strokec5  _state\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  onlyOwner \cb3 \strokec7 \{\cb3 \strokec5 \
    paused \cb3 \strokec7 =\cb3 \strokec5  _state\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 function\cb3 \strokec5  setOnlyWhitelisted\cb3 \strokec7 (\cb3 \strokec6 bool\cb3 \strokec5  _state\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  onlyOwner \cb3 \strokec7 \{\cb3 \strokec5 \
    onlyWhitelisted \cb3 \strokec7 =\cb3 \strokec5  _state\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
  \
  \cb3 \strokec6 function\cb3 \strokec5  whitelistUsers\cb3 \strokec7 (\cb3 \strokec6 address\cb3 \strokec7 []\cb3 \strokec5  \cb3 \strokec16 calldata\cb3 \strokec5  _users\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  onlyOwner \cb3 \strokec7 \{\cb3 \strokec5 \
    delete whitelistedAddresses\cb3 \strokec7 ;\cb3 \strokec5 \
    whitelistedAddresses \cb3 \strokec7 =\cb3 \strokec5  _users\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 function\cb3 \strokec5  withdraw\cb3 \strokec7 ()\cb3 \strokec5  \cb3 \strokec11 public\cb3 \strokec5  onlyOwner \cb3 \strokec7 \{\cb3 \strokec5 \
    
\f1 \cb19 \strokec20 // This will pay HashLips 5% of the initial sale.
\f0 \cb3 \strokec5 \
    \cb3 \strokec4 // You can remove this if you want, or keep it in to support HashLips and his channel.\cb3 \strokec5 \
    \cb3 \strokec4 // =============================================================================\cb3 \strokec5 \
    \cb3 \strokec7 (\cb3 \strokec6 bool\cb3 \strokec5  hs\cb3 \strokec7 ,\cb3 \strokec5  \cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec7 =\cb3 \strokec5  \cb3 \strokec11 payable\cb3 \strokec7 (
\f1 \cb19 \strokec21 0x943590A42C27D08e3744202c4Ae5eD55c2dE240D
\f0 \cb3 \strokec7 ).\cb3 \strokec5 call\cb3 \strokec7 \{\cb3 \strokec5 value\cb3 \strokec7 :\cb3 \strokec5  \cb3 \strokec6 address\cb3 \strokec7 (\cb3 \strokec17 this\cb3 \strokec7 ).\cb3 \strokec5 balance \cb3 \strokec7 *\cb3 \strokec5  \cb3 \strokec8 5\cb3 \strokec5  \cb3 \strokec7 /\cb3 \strokec5  \cb3 \strokec8 100\cb3 \strokec7 \}(\cb3 \strokec9 ""\cb3 \strokec7 );\cb3 \strokec5 \
    \cb3 \strokec13 require\cb3 \strokec7 (\cb3 \strokec5 hs\cb3 \strokec7 );\cb3 \strokec5 \
    \cb3 \strokec4 // =============================================================================\cb3 \strokec5 \
\
    \cb3 \strokec4 // This will transfer the remaining contract balance to the owner.\cb3 \strokec5 \
    \cb3 \strokec4 // Do not remove this otherwise you will not be able to withdraw the funds.\cb3 \strokec5 \
    \cb3 \strokec4 // =============================================================================\cb3 \strokec5 \
    \cb3 \strokec7 (\cb3 \strokec6 bool\cb3 \strokec5  os\cb3 \strokec7 ,\cb3 \strokec5  \cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec7 =\cb3 \strokec5  \cb3 \strokec11 payable\cb3 \strokec7 (\cb3 \strokec5 owner\cb3 \strokec7 ()).\cb3 \strokec5 call\cb3 \strokec7 \{\cb3 \strokec5 value\cb3 \strokec7 :\cb3 \strokec5  \cb3 \strokec6 address\cb3 \strokec7 (\cb3 \strokec17 this\cb3 \strokec7 ).\cb3 \strokec5 balance\cb3 \strokec7 \}(\cb3 \strokec9 ""\cb3 \strokec7 );\cb3 \strokec5 \
    \cb3 \strokec13 require\cb3 \strokec7 (\cb3 \strokec5 os\cb3 \strokec7 );\cb3 \strokec5 \
    \cb3 \strokec4 // =============================================================================\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 function\cb3 \strokec5  _mintLoop\cb3 \strokec7 (\cb3 \strokec6 address\cb3 \strokec5  _receiver\cb3 \strokec7 ,\cb3 \strokec5  \cb3 \strokec6 uint256\cb3 \strokec5  _mintAmount\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec11 internal\cb3 \strokec5  \cb3 \strokec7 \{\cb3 \strokec5 \
    \cb3 \strokec10 for\cb3 \strokec5  \cb3 \strokec7 (\cb3 \strokec6 uint256\cb3 \strokec5  i \cb3 \strokec7 =\cb3 \strokec5  \cb3 \strokec8 0\cb3 \strokec7 ;\cb3 \strokec5  i \cb3 \strokec7 <\cb3 \strokec5  _mintAmount\cb3 \strokec7 ;\cb3 \strokec5  i\cb3 \strokec7 ++)\cb3 \strokec5  \cb3 \strokec7 \{\cb3 \strokec5 \
      supply\cb3 \strokec7 .\cb3 \strokec5 increment\cb3 \strokec7 ();\cb3 \strokec5 \
      _safeMint\cb3 \strokec7 (\cb3 \strokec5 _receiver\cb3 \strokec7 ,\cb3 \strokec5  supply\cb3 \strokec7 .\cb3 \strokec5 current\cb3 \strokec7 ());\cb3 \strokec5 \
    \cb3 \strokec7 \}\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\
  \cb3 \strokec6 function\cb3 \strokec5  _baseURI\cb3 \strokec7 ()\cb3 \strokec5  \cb3 \strokec11 internal\cb3 \strokec5  \cb3 \strokec11 view\cb3 \strokec5  \cb3 \strokec17 virtual\cb3 \strokec5  \cb3 \strokec18 override\cb3 \strokec5  \cb3 \strokec14 returns\cb3 \strokec5  \cb3 \strokec7 (\cb3 \strokec6 string\cb3 \strokec5  \cb3 \strokec16 memory\cb3 \strokec7 )\cb3 \strokec5  \cb3 \strokec7 \{\cb3 \strokec5 \
    \cb3 \strokec14 return\cb3 \strokec5  uriPrefix\cb3 \strokec7 ;\cb3 \strokec5 \
  \cb3 \strokec7 \}\cb3 \strokec5 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec7 \}\cb3 \strokec5 \
}