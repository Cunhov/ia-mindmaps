const fs = require('fs');
const path = require('path');

const mapsDir = path.join(__dirname, 'maps');
const outputFile = path.join(__dirname, 'maps.js');

if (!fs.existsSync(mapsDir)) {
  fs.mkdirSync(mapsDir);
}

// Read markdown files
const mapFiles = fs.readdirSync(mapsDir).filter(f => f.endsWith('.md'));

if (mapFiles.length === 0) {
  console.log("Nenhum arquivo markdown encontrado em 'maps/'. Adicione arquivos .md primeiro.");
  process.exit(0);
}

const mapsData = mapFiles.map(file => {
  const filePath = path.join(mapsDir, file);
  const content = fs.readFileSync(filePath, 'utf-8');
  
  // Extract title from the first level 1 heading (# Title)
  const lines = content.split('\n');
  const titleLine = lines.find(line => line.startsWith('# '));
  const title = titleLine ? titleLine.replace('# ', '').trim() : file.replace('.md', '');
  
  return {
    id: file.replace('.md', ''),
    title: title,
    filename: file,
    content: content
  };
});

const fileContent = `// Gerado automaticamente por update-maps.js. Não edite este arquivo diretamente.\nwindow.MINDMAPS_DATA = ${JSON.stringify(mapsData, null, 2)};`;

fs.writeFileSync(outputFile, fileContent, 'utf-8');
console.log(`Sucesso: ${mapFiles.length} mapas compilados em maps.js!`);
