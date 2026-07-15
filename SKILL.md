---
name: mindmap-generator
description: Instruções completas para criação e edição de mapas mentais em Markdown (.md) 100% compatíveis com o Markmap e o MindFlow AI.
---

# 🧠 MindFlow AI - Especificação Técnica para Criação de Mapas Mentais

Este guia serve como instrução definitiva (Skill) para que qualquer LLM ou agente de IA gere arquivos Markdown (`.md`) perfeitamente compatíveis com o motor do **Markmap (D3.js)** e a interface do **MindFlow AI**, garantindo renderização fluida, correta divisão de ramificações, preservação de layouts de mídia e ausência de erros de formatação.

---

## 1. Estrutura Hierárquica do Arquivo (A Árvore)

O Markmap compila a estrutura visual do mapa mental com base na hierarquia dos títulos e listas do Markdown. Siga rigidamente estas regras:

*   **Título Principal (Nível 0 - Raiz)**: Deve haver apenas **um único** título principal no topo do arquivo iniciando com `#`. Ele representa a ideia central.
    ```markdown
    # Minha Ideia Central
    ```
*   **Ramos Principais (Nível 1 - Tópicos)**: Representados por títulos de nível 2 (`##`). Cada `##` gera uma ramificação direta da ideia central.
    ```markdown
    ## Primeiro Grande Tópico
    ```
*   **Subramos (Nível 2+ - Detalhes)**: Representados por listas com marcadores (`-`). A profundidade/nível é definida **exclusivamente por espaços de recuo**.
    *   **IMPORTANTE**: Use sempre **2 espaços** por nível. **Nunca use Tabs**.
    ```markdown
    ## Primeiro Grande Tópico
    - Subtópico Nível 2
      - Detalhe Nível 3
        - Mini-detalhe Nível 4
    ```

### Exemplo de Estrutura de Árvore Válida:
```markdown
# 📈 Marketing Digital
## 1. Tráfego Orgânico
- SEO (Otimização)
  - Palavras-chave
  - Conteúdo rico
- Redes Sociais
  - Instagram
  - YouTube
## 2. Tráfego Pago
- Meta Ads
- Google Ads
```

---

## 2. Regras de Formatação dos Textos nos Nós

Os nós aceitam formatações básicas de Markdown. Para garantir que nada quebre:

1.  **Negrito e Itálico**: Use `**texto**` para negrito e `*texto*` para itálico.
2.  **Links**: Links devem ser formatados como `[Texto Visível](https://url.com)`.
3.  **Caracteres Especiais**:
    *   Evite o uso de crases avulsas ou backticks (\`) se não for bloco de código inline, pois elas quebram a serialização de strings.
    *   Se for incluir fórmulas matemáticas, use delimitadores LaTeX `$ formula $`.
4.  **Linhas**: Evite nós muito longos. Tente manter o texto por nó curto e conciso.

---

## 3. Inserção de Mídias (HTML em Linha)

O MindFlow AI suporta imagens, vídeos e áudio embutidos nos nós usando tags HTML nativas. Elas devem ser adicionadas junto com o texto do nó, preferencialmente separadas por um `<br>`.

### A. Mídias Externas (URLs da Web)
Use as tags HTML padrão com os atributos apropriados:
*   **Imagens**: `<img src="https://site.com/foto.jpg" alt="Legenda">`
*   **Vídeos**: `<video src="https://site.com/video.mp4" controls></video>`
*   **Áudios**: `<audio src="https://site.com/audio.mp3" controls></audio>`

### B. Mídias Locais (IndexedDB)
Mídias carregadas localmente pelo computador do usuário utilizam uma chave de referência com o prefixo `local-media-` na propriedade `src`.
*   **Imagens**: `<img src="local-media-1738202938" alt="Nome do arquivo.png">`
*   **Vídeos**: `<video src="local-media-1738202938" controls></video>`
*   **Áudios**: `<audio src="local-media-1738202938" controls></audio>`

*Nota: Qualquer LLM gerando um mapa mental inicial deve utilizar URLs externas ou placeholders simples, já que chaves `local-media-` dependem de arquivos previamente upados pelo usuário.*

---

## 4. Erros Críticos que Devem ser Evitados

| Erro | O que causa | Solução Correta |
| :--- | :--- | :--- |
| Usar múltiplos títulos `#` | Gera múltiplas raízes, quebrando a árvore Markmap | Apenas um `#` por arquivo, no topo |
| Usar recuos com tabulações (`\t`) | Erro de compilação da hierarquia do mapa mental | Sempre usar **espaços** (2 espaços por nível) |
| Inserir tags HTML sem fechar | Quebra a marcação e oculta nós adjacentes no SVG | Sempre fechar tags como `</img>`, `</video>`, `</audio>` |
| Colocar quebras de linha Markdown (`\n`) no meio de um nó | Cria um nó órfão indesejado na árvore | Use `<br>` para quebras de linha dentro do mesmo nó |
| Adicionar códigos CSS/JS no Markdown | Falha de segurança e erro de renderização | Limite-se ao Markdown padrão e às tags de mídia autorizadas |

---

## 5. Exemplo Completo de um Mapa Mental Perfeito

```markdown
# 🎥 Planejamento de Vídeo Pro
## 💡 Roteiro e Ideia
- Definir Gancho Inicial (Primeiros 30s)
- Estruturar Conteúdo em 3 Pilares
- Chamada para Ação (CTA) no Final
## 🎨 Identidade Visual
- Paleta de Cores do Tema
- Thumbnail Chamativa
  - Imagem do Rosto Expressivo <br> <img src="https://picsum.photos/300/200" alt="Thumbnail Mockup">
  - Texto de Destaque Grande
## 🎵 Trilha Sonora e Efeitos
- Áudio de Fundo Otimizado <br> <audio src="https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3" controls></audio>
- Efeitos Sonoros de Transição (Whoosh)
```
