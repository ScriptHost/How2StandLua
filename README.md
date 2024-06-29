# How2StandLua
Bienvenue cher(e) lect(eur/trice).
Si vous êtes là je suppose que vous souhaitez en apprendre plus sur la manière de faire vos propres luas sur le mod menu Stand, si oui, alors commençons.

Vous allez avoir besoin d'un logiciel pour écrire votre code, à moins que vous voulez écrire sur Bloc-Notes...
Vous pouvez installer [Visual Studio Code](https://code.visualstudio.com/download), celui que j'utilise.
Il y en a d'autre comme [Notepad++](https://notepad-plus-plus.org/downloads/), [Sublime Text](https://www.sublimetext.com/download) et j'en passe.

## Sources
[La documentation Lua de Stand (En Anglais)](https://stand.gg/help/lua-api-documentation)
[Le salon #programming du Discord de Stand (En Anglais)](https://discord.com/channels/956618713157763072/956618713581387806)
[im_too_strong <3](<https://discord.com/users/472825438700437504>)

## Bases

On va commencer par la base de la base ; créer le fichier Lua.
Afin de faire ça, nous allons nous rendre :
- En jeu
  -[Stand > Lua Scripts > Ouvrir Dossier](https://stand.gg/focus#Stand>Lua%20Scripts>Open%20Folder)
  - Cliquez sur 'Focus in Stand' et vous devriez être directement sur le bouton "Ouvrir Dossier" dans Lua Scripts.
- Le Launchpad
  - Cliquez sur le bouton "Open Stand Folder" puis cliquez sur "Lua Scripts"

Nous allons devoir maintenant afficher les extensions des fichiers, pour se faire :
Windows 11 :
- Dans votre explorateur de fichiers, cherchez "Afficher" et cliquez sur "Afficher" puis cliquez sur "Extensions de nom de fichier".
Windows 10 :
- Dans votre explorateur de fichiers, cliquez sur "Affichage", ensuite cochez "Extensions de noms de fichier"

Maintenant, vous pouvez créer votre document texte (Clic Droit > Nouveau > Document Texte), le nommer comme vous voulez et remplacer ".txt" en ".lua" / __".pluto*"__ puis l'ouvrir.
- Note : Je n'irai pas sur Pluto ici, vous pouvez en apprendre plus sur [sa documentation](https://pluto-lang.org/docs/Introduction) qui est en anglais.

## Bases (les vraies)

Références : [Documentation Lua de Stand](https://stand.gg/help/lua-api-documentation)

`menu.my_root` : C'est "le lobby" de votre script, un endroit ou vous pouvez placer vos futurs options
`menu.action / menu.toggle / menu.toggle_loop` : C'est les "interrupteurs" que vous allez utiliser.
L'action est comme un bouton, une fois pressé, le code s'éxécutera et s'arrétera à la fin.
Le toggle est comme un levier, quand il est activé, il éxécutera le code pour l'activer et quand il est désactivé, re-éxécutera le code pour le désactiver.
Le toggle_loop est comme un levier, sauf que il a la spécificité de répéter le code en boucle.
`menu.list` : C'est ce qui va être utiliser pour regrouper toutes les options au même endroits.

Maintenant, comment les utiliser?

On va faire un bouton, basique et qui fait une notification Stand disant "Bonjour!" quand on appuie sur le bouton.
```
menu.action(menu.my_root(), "Nom du Bouton", {"commande"}, "Description", function()
  util.toast("Bonjour!")
end)
```
menu.action est ce qui désigne quel "interrupteur" c'est, en l'occurance c'est un bouton.
menu.my_root() désigne l'emplacement du bouton, en l'occurance, "le lobby" du script.
util.toast est une des nombreuses fonctions qui en l'occurance fait une notification Stand.

Maintenant nous allons déplacer le bouton dans une list.

D'abord, nous allons faire une list, comme cela :
```
menu.list(menu.my_root(), "Nom de la liste", {"commande"}, "Description")
```

Maintenant, donnons-lui un petit nom pour pouvoir mettre le bouton dedans.

```
list = menu.list(menu.my_root(), "Nom de la liste", {"commande"}, "Description")
```

Pour déplacer le bouton il faudra remplacer `menu.my_root()` par `list`, ce qui devrait ressembler à ça:

```
menu.action(list, "Nom du Bouton", {"commande"}, "Description", function()
  util.toast("Bonjour!")
end)
```

Si vous avez copier collé jusque la, votre script devrait ressembler à ça :
![Code](https://github.com/ScriptHost/How2StandLua/assets/135753695/3bde681f-eca9-42d6-b38e-b68f0f0d75c4)
![In-Game 1](https://github.com/ScriptHost/How2StandLua/assets/135753695/e521733b-8c9f-40fb-9e09-399848e9c24d)
![In-Game 2](https://github.com/ScriptHost/How2StandLua/assets/135753695/9a6a0ea9-4ee3-4cae-ac9b-7dd2c6b5ed9a)

Nous allons maintenant faire un `toggle` qui va activer et désactiver une commande dans Stand, dans ce cas la, le Super Saut, tout en notifiant l'utilisateur que le Super Saut à été activé.

```
menu.toggle(menu.my_root(), "Super Saut", {"scriptsupersaut"}, "Active et Désactive le Super Saut se trouvant dans 'Soi'.", function(on)
  if on then
    menu.trigger_commands("superjump on")
    util.toast("Super Saut activé!")
  else
    menu.trigger_commands("superjump off")
    util.toast("Super Saut désactivé!")
  end
end)
```

`menu.trigger_commands` va éxécuter une commande, comme si vous éxécutiez une commande via la boîte de commande en appuyant sur U.
On met également un deuxième 'end' pour mettre fin au 'if', le 'end' juste après mettant fin à la fonction entière.
if est pour mettre une condition, la condition dans ce cas la est "on".

Si on le traduit ça ferait :
```
si allumé alors
  menu.trig...
sinon
  menu.trig...
fin
fin
```

Et maintenant, un toggle_loop, qui affichera une notification en boucle:

```
menu.toggle_loop(menu.my_root(), "Nom du Toggle Loop", {"commande"}, "Description", function()
  util.toast("La loop est activée!")
end)
```

À noter que pour rajouter du délai à votre loop, pour ne pas vous faire bugger, vous pouvez utiliser `util.yield`, une fonction permettant de mettre en pause la fonction en cours.

```
menu.toggle_loop(menu.my_root(), "Nom de Toggle Loop", {"commande"}, "Description", function()
  util.toast("La loop est activée!")
  util.yield(1000)
end)
```

Il faut aussi noter que le temps mis entre les parenthèses de `util.yield` est en millisecondes, 1000 = 1 seconde.
