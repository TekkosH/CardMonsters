local cards = {}
---criação da carta Demogorgon
cards.Demogorgon = {
    name = "Demogorgon",
    type = "Monstro / Aberração",
    description =
    "O Demogorgon é uma criatura poderosa e aterrorizante do mundo invertido, conhecido por sua força bruta e habilidades mágicas.",
    attributes = {
        HP = 5,
        SPD = 5,
        ATK = 3,
        DEF = 3,
        INT = 2
    },
    passiveAbility = "Echolocation",
    activeAbility = "Devour"
}

cards.Eleven = {
    name = "Jane Hopper (Eleven)",
    type = "Humano / Psíquico",
    description =
    "Eleven é uma jovem com habilidades psíquicas extraordinárias, capaz de manipular objetos e acessar outras dimensões.",
    attributes = {
        HP = 2,
        SPD = 6,
        ATK = 4,
        DEF = 1,
        INT = 7
    },
    passiveAbility = "Telepathic Link", --Permite sentir a presença de inimigos a cada turno de ataque.
    activeAbility = "Psychic Push",     --Empurra objetos ou inimigos com força psíquica.
    UniquePassive = "Love Power"        -- Quando está com Mike ferido, sua força aumenta consideravelmente.
}

cards.DemoDogs = {
    name = "Demodogs",
    type = "Monstro / Aberração",
    description =
    "Demodogs são criaturas agressivas e rápidas do mundo invertido, semelhantes a cães, que caçam em matilhas.",
    attributes = {
        HP = 4,
        SPD = 8,
        ATK = 3,
        DEF = 2,
        INT = 1
    },
    passiveAbility = "Pack Tactics", --dependendo da quantidade de hp eles ganham mais ataque e defesa.
    activeAbility =
    "Pack charge"                    -- Dependendo da quantidade de demodogs em campo, eles podem atacar juntos causando mais dano.
}

cards.Nortragamus = {
    name = "Nortragamus",
    type = "Extraterrestre",
    description =
    "Nortragamus é um ET de um planeta desconhecido que motiva os aliados com suas rimas e ervas um tanto exóticas.",
    attributes = {
        HP = 6,
        SPD = 5,
        ATK = 2,
        DEF = 4,
        INT = 8
    },

    passiveAbility = "Green smell",    --A cada turno, recupera 1 de HP para todos os aliados em campo.
    activeAbility = "Barras & Barras", --Aumenta o ataque e a defesa de todos os aliados em campo por 2 turnos
    UltimateAbility = "All good"       --Remove todos os efeitos negativos dos aliados com uma fumaça misteriosa.
}

cards.Xtranho = {
    name = "777-666",
    type = "Sobre-humano",
    description = "Um viajante no tempo enigmático que traz vida por onde passa. Possui um exército de gorilas roxos e umas plantas e cogumelos que o deixam mais forte",
    attributes = {
        HP = 6,
        SPD = 4,
        ATK = 3,
        DEF = 3,
        INT = 7
    },
    passiveAbility = "Regenerative Aura", --Regenera o hp de si mesmo e dos aliados em 1 a cada 3 turnos.
    activeAbility = "Kiss the Canvas",    -- Golpe de boxe que causa dano e atordoa o inimigo por 1 turno.
    UltimateAbility = "Mushroom Boost" --Come ou faz um aliado comer um cogumelo deixando o usuário imortal até seu próximo turno de ataque.
}


return cards
