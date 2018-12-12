VAR dice = false
VAR chalk = false
VAR wallet = 5

VAR diceCost = 1
VAR chalkCost = 1


Dana: Late 1960s, Massachusetts.

Dana: Your mom is standing on the porch.

+ [Talk to Mom]
-> Mom1

=== Mom1

Dana: Mom! Look! God sent me a baby!
Mom: ...Excuse me?
Dana: Her name is Kimmy!
-> Kimmy1

= Kimmy1
+ [It seems that Kimmy has something to say.]
Kimmy: ...
-> Nope


= Nope
* {X} [Click to continue] -> Y
* {not X} [Click to continue] -> X

= X
Mom: That… No, Dana. God did not send you a baby.

Dana: What do you mean…? You said God sends people babie sometimes! You told me that.

Mom: Well… nevermind what I said. It doesn’t apply to you. God isn’t about to send you a baby anytime soon, trust me.

Dana: What! Why? I wished for a baby, and he granted my wish. Isn’t it obvious?

Mom: Where did you find this little girl? Honey, where’s your house?
-> Kimmy1

= Y
Mom: Kimmy, can you tell me where your parents are?

Kimmy: I can go home later if I want…

Mom: Well maybe God didn’t send her, but she came out of nowhere! Kimmy, you just… appeared, right? Where did you come from?

Kimmy: Ferry Street... I untied myself from the porch so I could go for a walk…
Mom: It’s ok dear, let’s go to your house Kimmy… you said it’s on Ferry Street? Your parents are probably worried.
+ [Take Kimmy Home] ->KMom1

=== KMom1
Dana: I’m sorry… I thought God sent me a baby and I got so excited…
Kimmy's Mom: Oh, don’t worry. Thank you for finding Kimmy and walking her home. What's your name, dear?
Dana: I'm Dana...
Kimmy's Mom: I don’t know many kids as responsible as you, walking Kimmy all the way home. I hope you two can be friends. I know Kimmy could learn a lot from you.
Kimmy: My… friend?
Dana: I’d love to be friends, Kimmy. Can I come by and play with you tomorrow?
Kimmy's Mom: I’ve been looking for a babysitter, actually. Her grandma was helping with that before, but she… well, she can’t anymore.
Kimmy's Mom: Kimmy’s normally alright in her harness on the porch, but she’s getting a little old for that…
Kimmy's Mom: If you’d like to play with Kimmy tomorrow, I’d be happy to pay you a quarter to keep an eye on her.
Dana: Wow! Yes, please! I’d love to!
Kimmy's Mom: My work schedule is a little… hectic. It’d be great to have you by in the morning.
Dana: I'll be here first thing! Wow, I didn’t expect to land a job today. Thanks so much! 
Mom: Well, that all sounds good to me. A summer job will be a nice way to keep busy. Now then, let’s leave this nice family to their dinner.
Dana: Ok. Bye bye Kimmy, and Mrs...?
Kimmy's Mom: Mrs. Munro. Again, thank you for giving Kimmy a hand. It was nice meeting you, Mrs. Navarro.
Mom: Likewise.
Kimmy: Bye bye. ->Day1Intro

=== Day1Intro
*[Day 1]
Dana: Mornin’ Kimmy! I’m here to babysit, like I promised! Is your mom around?
Kimmy: My mommy’s not inside. She left already.
Dana: Oh, ok… Um, well… Is there anything you’d like to do today, Kimmy?
Kimmy: No… I don’t know.
Dana: That’s ok, do you have a friend you’d like to visit?
Kimmy: No... ->watch_tv

=watch_tv
+[Watch TV?]
Dana: Should we watch TV or something in your house?
Kimmy: We don’t have a TV. My dad is in there too, so we should go play somewhere else. He’s busy.
->walk_around

=walk_around
+[Want to walk around?]
Dana: Ok then! Want to walk around and play some games with the other kids?
Kimmy: Other kids…?
Dana: You know, the neighborhood kids. Like Donna. Isn’t she your age? You’re both going to be in Kindergarten, right?
Kimmy: Oh, yeah… I don’t think Donna is my friend though, so she probably wouldn’t want to play...
Dana: Well, let’s go become her friend! There's lots of other kids around, too. Like Anthony. I know him from school.
Dana: Come on, let’s go!
Kimmy: ...!
->where_to_go

=== where_to_go
Dana: Where should we go?
+ [Store] -> Store
+ [Downtown] -> Downtown
+ [Playground] ->Playground

* {anthony_play} {donna_play} [End Day 1] ->end_day_1

===Playground
Dana: The playground is full of friends to make, Donna is standing around, maybe Kimmy can be friends with her. 
+ [Donna] ->Donna

+ {donna_play}[You have already played with Donna today!] ->where_to_go

===Downtown
Dana: Downtown is ful of shops and friends to make! Your friend Anthony is with his little sister Amber. 
+ [Talk to Anthony] -> Anthony
+ {anthony_play} [You have already played with Anthony and Amber today!] ->where_to_go

===Store
Dean: Hey, Kid.
Dana: Hi, Dean. This is Kimmy. I’m babysitting her now.
Dean: Well lookit that, aren’t you all grown up. You gettin’ paid?
Kimmy: My mom pays Dana a quarter a day.
Dana: That's right! I’m here to buy some things… I mean, I haven’t gotten paid yet. This is my first day. But I have some money saved up!
Dean: Hah, I wish I had that kinda discipline. I blew my budget on fabric last week.
Dana: I need to save up money. For college, you know! My mom would get so mad if I didn’t plan ahead.
Dean: Hah! Your mom’s got the right idea. I wish I’d saved up for college.
Dana: So what did you spend all your money on? Your sewing classes?
Dean: Nah, that’s over. I’m workin’ on some Halloween costumes for my cousins… and some new pants for myself. You know, gotta apply those skills somehow.
Kimmy: I didn’t know people made clothes!
Dean: They do, Kimmy, they do. I make sweaters, dresses, hats--you name it.
Dana: You should sell your clothes at Jordan Marsh! That’s where I always find the nicest clothes.
Dean: Hah! That’s a long ways off for me. But maybe someday… anyways, what can I get for ya? 
+[Shop] ->shop

===shop
Dean: We have lots of things to buy so you can play games with your friends. 

Money - {wallet}
{chalk : You have chalk}
{dice : You have dice}

+ [dice - {diceCost}]
{diceCost <= wallet: 
    ~ wallet = wallet - diceCost
    ~ dice = true
    ->bought
-else: ->nomoney
}

+ [chalk - {chalkCost}]
{chalkCost <= wallet: 
    ~ wallet = wallet - chalkCost
    ~ chalk = true
    ->bought
-else: ->nomoney
}

+ [Leave] ->clerk_outro

=clerk_outro
Dana: Thanks, Dean!
Kimmy: Thank you Mr. Dean!
Dean: Bye bye girls. Have fun.
+ [Where to go?] ->where_to_go
        
=nomoney
Dean: Not enough money. 
+[Keep shopping] ->shop
->DONE

=bought
Dean: Added to games! 
+ [Keep shopping] ->shop

=== Donna
Kimmy: Hi Donna.
Donna: What happened, Kimmy? Did you untie yourself from the porch again?
Kimmy: ... 
Dana: Hi Donna! I’m babysitting Kimmy now, so--
Donna: So you untied Kimmy from the porch? Better not let her parents catch you.
Dana: First of all, I’m her babysitter. Second, she’s perfectly able to untie herself. She’s too old for that thing now, even her mom thinks so.
Donna: She should probably stay on her porch. We’re the same age, but my mom takes me everywhere so I won’t get lost. I bet Kimmy would get lost if she wandered too far.
Dana: I don’t know about that. Anyways, I was just going to ask if you wanna play with us... but I feel like you're being mean to Kimmy.
Donna: Oh, no. I'm just being honest!
+[Play a game?] -> donna_play
+[Go somewhere else] -> where_to_go

===donna_play
Dana: Ok... well, I hope you two can get along, since you're neighbors... want to play a game with us?
Donna: Well, I’m trying to avoid Harold so it’s probably good to look busy. He keeps trying to tell me that my ears look childish. He is so snobby.
Kimmy: I like your ears.
Donna: Oh, thanks. They’re new. Anyways, I wanna play a new game.
->pickgameDonna

=pickgameDonna
Dana: Which game should we play?
+ [Hopscotch] -> hopscotch
+ [Yahtzee] -> yahtzee 

=hopscotch
{chalk: Dana: Okay let's play Hopscotch then.}
{chalk == false: ->nogamepieces} 
+ [Friends!] -> donna_taughtgame


=yahtzee
{dice: Dana: Okay let's play Yahtzee then.}
{dice == false: ->nogamepieces}
+ [Friends!] ->donna_taughtgame


===donna_taughtgame
Donna: Kimmy loved that.
Donna: I’m surprised, normally you’re so quiet Kimmy.
Kimmy: Mom said it’s ok to be quiet.
Dana: That’s right! Games are a nice way to talk and play with your friends though, don’t you think? Even quiet kids like games, I think, usually.
Kimmy: … Are we friends? I thought you were my babysitter.
Dana: Yes! Of course we’re friends! I know we just met yesterday, but… that’s normal!
Kimmy: I always thought babysitters were more like parents.
Dana: I can be your friend AND your babysitter. We’re having fun playing games together, right? That’s what friends do a lot of the time.
Dana: Anthony and I became friends by playing games together. We met playing kickball.
Donna: Anthony and his little sister Amber are… annoying. Don’t tell them I said that though…
Dana: Anthony and I go to the same school and do sports together sometimes. He’s way nicer than the other boys at my school. I like him and Amber.
Donna: There’s no rule that says you have to like your classmates.
Dana: Yeah, I know… but Anthony is nice to me, so I like him.
Donna: Oooh, you like... Like him?
Dana: …I’m not going to answer that, Donna. Who I like is none of your business.
->where_to_go

=== Anthony
Dana: Hey Anthony.
Anthony: Hi Dana. It’s so weird seeing you outside of school, haha.
Amber: I’m Amber!
Anthony: This is my little sister, Amber. Is that your sister, Dana? I didn’t know you had a little sister.
Dana: Oh, no… This is Kimmy. I’m her babysitter.
Anthony: Isn’t Kimmy the girl that Jim--
Amber: Anthony! I know you’re mad at Jimmy, but--
Anthony: I know, I know, nevermind.
Dana: Uhhhh… what? What’s the gossip?
Anthony: Nevermind! Hi Kimmy. I remember seeing you walk to school last year. Isn’t it a bit far to walk? You should ride a bike, at least.
Kimmy: Oh... I don't know. 
Anthony: Are you two headed somewhere? You should hang out with Amber and I. 
->playgameanthony

=playgameanthony
+[Ask to play game] ->anthony_play
+[Go somewhere else] -> where_to_go

===anthony_play
Dana: Well, we'd like to play a game! 
Anthony: We'd been playing games with Harole earlier... but maybe we could try something new? Amber's kind of picky though - fair warning.
Amber: Am not! 
-> day1_anthony_teachgame

=day1_anthony_teachgame
-> pickgameAnthony

=pickgameAnthony
Dana: Which game should we play?
+ [Hopscotch] -> hopscotch
+ [Yahtzee] -> yahtzee 

=hopscotch
{chalk: Dana: Okay, let's play Hopscotch then.}
{chalk == false: ->nogamepieces} 
+ [Friends!] -> anthony_amber_taughtgame

=yahtzee
{dice: Dana: Okay, let's play Yahtzee then.}
{dice == false: ->nogamepieces}
+ [Friends!] ->anthony_amber_taughtgame

===anthony_amber_taughtgame
Dana: You two picked that up really fast!
Anthony: It’s easier to learn games if you work together. I think we make a good team. When Amber doesn’t get distracted, that is.
Amber: I don’t like boring stuff. It was fun though.
Anthony: You sound like Donna.
Amber: No, I don’t! Donna’s annoying, but I’m not.
Anthony: Well, you’re not as bad as Linda, that’s for sure…
Amber: Shut up! That’s mean!
Anthony: Ok, ok, sorry.
Amber: We should play together at school sometime, Kimmy.
Dana: You hear that Kimmy? That’s great! I’m glad that you two go to the same school.
Kimmy: I don’t play with anyone usually, but I think I’d like that.
->where_to_go

===nogamepieces
Dana: Oh no! I’m sorry… I thought I had some stuff to play games with in my bag… but it looks like I ran out.
Kimmy: Oh no...
Dana: It’s ok! Kimmy, let’s run to the store and buy some game pieces! We’ll be right back!
+ [Go to Store] ->Store

===end_day_1
Dana: Mrs. Munro? I'm here to drop Kimmy off.
Kimmy's Mom: Welcome back, girls.
Dana: We had a good time today!
Kimmy's Mom: There you are Kimmy. Wonderful Dana, thank you so much… you’re such a great help. I really…
Kimmy's Mom: Oh, where is it? Work was so busy but I swear I didn't forget...
Kimmy's Mom: Here we go. Your quarter, Dana.
+[Thank you so much!] ->day1outro_next1

=day1outro_next1
Dana: Thank you so much! May I come again tomorrow?
Kimmy: Yes!
Kimmy's Mom: It would be a great help, if you could.
Dana: Ok, see you tomorrow!
Mom: There you are.
+[Mom!] ->day1outro_next2

=day1outro_next2
Mom: I was just stopping by the corner store to grab some milk. Are you done babysitting Kimmy?
Dana: Yes!
Kimmy's Mom: Hello, Mrs. Navarro. I’ll be going inside now. Let's go, Kimmy. You need to have some dinner.
Mom: Have a nice evening.
	I’ll walk home with you, mom.
Dana: ...Mom, when I picked Kimmy up this morning, she had a rope tied around her. Is that… normal?
Mom: Oh, was she tied to the doorknob?
Dana: She was tied to the porch.
Mom: My mom used to tie me to the doorknob so she could focus on making dinner.
Mom: It’s a little old-fashioned. -> day1ourtro_next3

=day1ourtro_next3
Dana: You never tied me up, though?
Mom: ...well, I suppose I never worried about you running off.
Mom: My mom used to worry I’d get into trouble, so when I was Kimmy’s age she’d keep me hooked to the doorknob if there was no one to keep an eye on me.
Dana: Wow… that's kinda weird.
Mom: A harness is a cheap babysitter.->day1outro_next4

=day1outro_next4
Dana: I guess so... well, I'm definitely a better babysitter than a harness.
Mom: Come on, let’s head home. I’m glad you have a job now. Keeping busy is good for a girl your age.
Dana: I hope I can be a good babysitter. Kimmy is kind of quiet, so it’s hard to tell if she’s having fun.
Mom: You’ll do fine.
->DONE

=== Done
->DONE



