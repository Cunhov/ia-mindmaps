# MindFlow AI 🧠

Um aplicativo de mapas mentais open-source, extremamente leve e altamente customizável, desenvolvido especialmente para ser utilizado durante gravações de vídeos no YouTube e apresentações ao vivo.

## 🚀 Como Executar o Aplicativo

Como o aplicativo é feito em HTML e Javascript puros e utiliza CDNs estáveis, você não precisa de nenhuma instalação complexa ou banco de dados.

### Opção 1: Abrir Diretamente no Navegador (Mais Fácil)
Basta dar dois cliques no arquivo `index.html` ou arrastá-lo para dentro de qualquer navegador (Chrome, Edge, Firefox, Safari).

### Opção 2: Servir Localmente (Recomendado)
Para evitar restrições de segurança do navegador ao carregar arquivos locais, você pode iniciar um servidor local rápido. Na pasta do projeto, execute no terminal:

```bash
# Se tiver Python instalado:
python3 -m http.server 8000

# Ou se preferir usar o Node (npx):
npx serve
```
Depois, abra `http://localhost:8000` ou a porta indicada no terminal.

---

## 🤖 Como Criar Mapas com IA pelo Chat do Antigravity

Sempre que precisar de um novo mapa mental para os seus vídeos, siga estes passos simples:

1. **Faça o pedido no chat** com o tema e as diretrizes do seu vídeo. Exemplo:
   > *"Crie um mapa mental sobre 'Como começar na programação em 2026' com 4 ramificações principais: Linguagens, Projetos, Estudo e Mercado de Trabalho."*
2. **Eu (o assistente de IA)** criarei o arquivo `.md` na pasta `maps/` e executarei automaticamente o script de compilação.
3. **Atualize a página do app** no seu navegador. O mapa novo estará listado no menu lateral pronto para ser apresentado!

---

## 🎨 Temas Otimizados para Gravações (YouTube)

O visualizador conta com temas customizados para garantir máxima legibilidade em vídeo:

*   📺 **YouTube Presenter**: Alto contraste com fundo muito escuro e cores primárias vibrantes.
*   ⚡ **Cyberpunk Neon**: Estética com neon ciano, rosa e roxo sobre fundo preto espacial.
*   🌲 **Nordic Forest**: Visual relaxante com tons terrosos, verde escuro e dourado.
*   🌑 **Minimal Slate**: Fundo azul-escuro com linhas suaves e elegantes.
*   ☀️ **Creamy Light**: Fundo claro e quente com tons pastéis profissionais.

---

## ⌨️ Atalhos Rápidos (Modo Apresentador)

Com o foco no mapa (clique na tela para garantir o foco), use as seguintes teclas:

| Tecla | Ação |
| :--- | :--- |
| **`P`** ou **`F`** | **Alterna o Modo Apresentação** (esconde toda a interface do app para focar apenas no mapa) |
| **`ESC`** | Sai do Modo Apresentação |
| **`E`** | Abre ou fecha o menu lateral do editor de Markdown |
| **`0` (Zero)** | Centraliza e auto-ajusta o zoom do mapa na tela |
| **`Tab`** | Alterna entre as abas **Mapas** e **Editor** na barra lateral |
| **`+`** / **`-`** | Aumenta ou diminui o zoom |
| **Clique e Arraste** | Move-se livremente pelo mapa |
| **Clique nos círculos** | Expande ou recolhe ramificações do mapa |

---

## 📂 Estrutura do Projeto

*   `index.html`: A interface principal, o editor ao vivo e o motor de renderização.
*   `update-maps.js`: Script Node.js que junta todos os mapas da pasta `maps/` em um único banco carregável (`maps.js`).
*   `maps.js`: Arquivo gerado automaticamente que serve de banco de dados para o `index.html`.
*   `maps/`: Diretório onde os arquivos de mapas mentais (.md) ficam salvos.
