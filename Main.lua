--Ideia geral, fazer jogo de carta de monstros de forma "simples" mas bem estruturada, atualizando conforme novas ideias surjam.
--Ter monstros de diversos jogos e tipos.
--Fazer essas fichas todas pelo console.
-- fazer fraquezas logo mais utilizando classes e objetos.

local cards = require("Cards")
local funcs = require("Funcs")

funcs.utf8Console()

funcs.cardSelect()         -- chama a função para selecionar a carta
funcs.enemyCardSelect()    -- chama a função para selecionar a carta inimiga
funcs.showCardAttributes() -- chama a função para mostrar atributos da carta escolhida

print("\nCarta inimiga selecionada: " .. GameState.enemyCard.name)

funcs.combat() -- chama a função de combate entre cartas
--[[
A fazer:
- Sistema de combate entre cartas
- Sistema de Turnos
- Condição de vida/morte
- Coleção ou deque de cartas
]]

print("\nFim do jogo!")
print("Obrigado por jogar!")
