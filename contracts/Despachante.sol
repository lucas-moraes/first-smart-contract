// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Despachante 
{
    struct DocumentoStruct
    {
        address proprietarioAtual;
        address ultimoProprietario;
        string modelo;
        string cor;
        uint16 ano; //65535
        string placa;
        bool existe;
    }

    mapping(uint256 => DocumentoStruct) public documentos;

    function cadastraDocumento(
        uint256 renavam, 
        string memory placa, 
        string memory modelo, 
        string memory cor, 
        uint16 ano
    ) external returns (DocumentoStruct memory retorno)
    {
        DocumentoStruct memory documento = documentos[renavam];
        require(!documento.existe, unicode"Documento já cadastrado");

        documento.placa = placa;
        documento.modelo = modelo;
        documento.cor = cor;
        documento.ano = ano;
        documento.existe = true;
        documento.proprietarioAtual = msg.sender;

        documentos[renavam] = documento;

        return documento;
    }

    function transferirDocumento(
        uint256 renavam, 
        string memory placa, 
        string memory modelo, 
        string memory cor, 
        uint16 ano, 
        address destinatario
    ) external returns (bool sucesso)
    {
        DocumentoStruct memory documento = documentos[renavam];
        require(!documento.existe, unicode"Esse veículo ainda não foi cadastrado no contrato. Utilizar função de cadasro primeiro.");
        require(
            keccak256(abi.encodePacked(documento.cor)) == keccak256(abi.encodePacked(cor)) &&
            keccak256(abi.encodePacked(documento.placa)) == keccak256(abi.encodePacked(placa)) &&
            keccak256(abi.encodePacked(documento.modelo)) == keccak256(abi.encodePacked(modelo)) &&
            keccak256(abi.encodePacked(documento.ano)) == keccak256(abi.encodePacked(ano)), unicode"Os dados informados não batem com os dados cadastrados.");
        require(documento.proprietarioAtual == msg.sender, unicode"A transferência precisa ser solitada pelo proprietario atual do veiculo.");

        documento.ultimoProprietario = documento.proprietarioAtual;
        documento.proprietarioAtual = destinatario;
        documentos[renavam] = documento;

        return true;
    }

}

