# Claude Code Agents

Colección de agentes personales para [Claude Code](https://claude.ai/code) — la CLI oficial de Anthropic.

---

## ¿Qué es esto?

Este repositorio contiene agentes personalizados (`subagents`) listos para usar con Claude Code. Cada agente tiene un propósito concreto y está optimizado para responder con precisión dentro de su dominio.

También incluye una **cheatsheet interactiva** con todos los comandos, flags y shortcuts de Claude Code.

---

## Cómo instalar los agentes

Copia el archivo `.md` del agente que quieras en tu directorio de agentes:

```bash
# Agente disponible globalmente (todos los proyectos)
~/.claude/agents/

# Agente solo para el proyecto actual
.claude/agents/
```

Después reinicia Claude Code o usa `/agents` para verificar que está disponible.

---

## Agentes disponibles

### `claude-code-expert`

> Experto en todo lo relacionado con Claude Code — la CLI oficial de Anthropic.

**Cuándo usarlo:** Cuando necesites ayuda con instalación, comandos CLI, slash commands, atajos de teclado, configuración, CLAUDE.md, sistema de memoria, integraciones MCP, hooks, subagentes, flujos de trabajo, troubleshooting o gestión de costes.

**Modelo:** `sonnet` · **Color:** amarillo

**Ejemplos de uso:**
- *"¿Cómo uso Claude Code en un pipeline CI/CD sin prompts interactivos?"*
- *"Mi CLAUDE.md no se está aplicando, ¿por qué?"*
- *"¿Cómo ejecuto ESLint automáticamente cada vez que Claude edita un archivo?"*
- *"¿Puedo tener Claude trabajando en dos features al mismo tiempo?"*

**Instalación:**
```bash
cp agents/claude-code-expert.md ~/.claude/agents/
```

---

## Cheatsheet

El archivo [`claude-code-cheatsheet.html`](./claude-code-cheatsheet.html) es una referencia visual completa de Claude Code con:

- Instalación y comandos CLI
- Todos los slash commands organizados por categoría
- Flags CLI detallados
- Sistema de memoria (CLAUDE.md + Auto Memory)
- Flujos de trabajo y pipelines
- Atajos de teclado

Ábrelo en el navegador o imprime/guarda como PDF desde el botón integrado.

---

## Estructura del repo

```
claude-code-agents/
├── agents/
│   └── claude-code-expert.md      # Agente experto en Claude Code
└── claude-code-cheatsheet.html    # Cheatsheet visual interactiva
```

---

## Contribuir

Si tienes un agente útil que quieras compartir, abre un PR con el archivo `.md` en la carpeta `agents/` siguiendo el formato estándar de Claude Code subagents.

---

*Hecho con Claude Code*
