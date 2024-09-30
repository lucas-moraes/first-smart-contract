# Projeto de Estudo: Contrato Despachante

Este projeto foi desenvolvido com o propósito de simular a transferência de veículos realizada em cartório, utilizando smart contracts em Solidity. 
O contrato armazena o proprietário atual, o último proprietário, e os dados do veículo como placa (modelo, cor, ano).
A função principal é responsável por realizar a transferência de propriedade, validando se o proprietário atual está realizando a transferência e se os dados do veículo correspondem aos dados previamente armazenados.
Detalhe importante, para fins de estudo o dado utilizado para a consulta será o renavam, e esse será do tipo int, ns vida real renavam contém letras e numeros,

## Ferramentas Utilizadas

- **Linguagem**: Solidity
- **IDE**: [Remix IDE](https://remix.ethereum.org/) - Para compilar e testar o contrato.
- **Blockchain**: Ethereum (usando a rede local de testes ou a rede Ethereum real)
  
## Descrição do Contrato

O contrato `Despachante` contém as seguintes funcionalidades principais:

- **Registrar veículo**: Permite ao proprietário atual registrar os detalhes do veículo, incluindo o modelo, a cor, o ano e a placa.
- **Transferir propriedade**: A função de transferência de propriedade verifica se o proprietário atual está realizando a transferência. Se a validação for bem-sucedida, o proprietário é atualizado no contrato.
- **Consultar dados do veículo**: Permite a consulta de informações registradas, incluindo o proprietário atual e o anterior, além dos dados do veículo.

## Exemplo de Uso

1. **Registrar o veículo**:
    O proprietário atual pode registrar um veículo com os seguintes dados:
    - **Modelo**: String
    - **Cor**: String
    - **Ano**: uint
    - **Placa**: String

2. **Transferir Propriedade**:
    Apenas o proprietário atual pode iniciar a transferência de propriedade para um novo dono. A função irá validar se o proprietário atual corresponde aos dados salvos no contrato.

3. **Consultar Dados do Veículo**:
    As informações sobre o veículo, incluindo o proprietário atual, o último proprietário e os dados da placa, podem ser consultadas a qualquer momento.

## Instalação e Uso

### 1. Clonar o Repositório
Clone o repositório em sua máquina:

```bash
git clone https://github.com/seu-usuario/seu-repositorio.git
cd seu-repositorio

### 2. Abrir no Remix IDE
Abra o arquivo do contrato Despachante.sol no Remix IDE https:/remix.ethereum.org.

### 3. Compilar e Deploy
No Remix IDE, compile o contrato e faça o deploy na rede de teste (por exemplo, na rede Ethereum local ou na testnet).

## Licença
Este projeto está sob a licença MIT. 
