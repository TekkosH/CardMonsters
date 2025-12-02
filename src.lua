--Ideia geral, fazer "banco de dados" de monstros de forma "simples" mas bem estruturada, atualizando conforme novas ideias surjam.
--Ter monstros de diversos jogos e tipos.
--Fazer essas fichas todas pelo console.

os.execute("chcp 65001") --Configura o console para UTF-8 no Windows

--função para escrever o nome da carta (vou utilizar isso no futuro, utilizando objetos.)
local function monsterCard(cardName, cardType, cardDescription, cardHP, cardSPD, cardATK, cardDEF, cardINT, cardP, cardSkill)
    print("=============================================================================================================================")
    print("| " .. "🪪 Nome: " .. cardName)
    print("| " .. "🏷️ Tipo: " .. cardType)
    print("| " .. "📖 Descrição: " .. cardDescription)
    print("| " .. "⏳ Habilidade Passiva: " .. cardP)
    print("| " .. "💥 Habilidade Ativa: " .. cardSkill)
    print("| ")
    print("| " .. "📃 ATRIBUTOS: ")
    print("| ")
    print("| " .. "❤️ Vitalidade:   " .. cardHP)
    print("| " .. "⚔️ Ataque:       " .. cardATK)
    print("| " .. "🛡️ Defesa:       " .. cardDEF)
    print("| " .. "🏃 Velocidade:   " .. cardSPD)
    print("| " .. "🧠 Inteligência: " .. cardINT)
    print("=============================================================================================================================")

end

--atributos e informações da carta
local cardName = "Demogorgon"
local cardType = "Monstro / Aberração"
local cardDescription = "O Demogorgon é uma criatura poderosa e aterrorizante do mundo invertido, conhecido por sua força bruta e habilidades mágicas."
local cardHP = 5
local cardSPD = 5
local cardATK = 7
local cardDEF = 3
local cardINT = 2
local cardP = "Echolocation"
local cardSkill = "Devour"

--monsterCard(cardName, cardType, cardDescription, cardHP, cardSPD, cardATK, cardDEF, cardINT, cardP, cardSkill)

--função para retornar atributos em barra (deve ser possível com utilização de objetos futuramente)
local function getAttributeBar(attribute)
    local fullChar = "🟩"
    local emptyChar = "⬛"

    local result = ""
    for i = 1, 10 , 1 do
        if i <= attribute then
            result = result .. fullChar
        else
            result = result .. emptyChar 
        end
    end
    return result
end

    print("=============================================================================================================================")
    print("| " .. "🪪  Nome: " .. cardName)
    print("| " .. "🏷️  Tipo: " .. cardType)
    print("| " .. "📖 Descrição: " .. cardDescription)
    print("| " .. "⏳ Habilidade Passiva: " .. cardP)
    print("| " .. "💥 Habilidade Ativa: " .. cardSkill)
    print("| ")
    print("| " .. "📃 ATRIBUTOS: ")
    print("| ")
    print("| " .. "❤️  Vitalidade:   " .. getAttributeBar(cardHP))
    print("| " .. "⚔️  Ataque:       " .. getAttributeBar(cardATK))
    print("| " .. "🛡️  Defesa:       " .. getAttributeBar(cardDEF))
    print("| " .. "🏃 Velocidade:   " .. getAttributeBar(cardSPD))
    print("| " .. "🧠 Inteligência: " .. getAttributeBar(cardINT))
    print("=============================================================================================================================")
