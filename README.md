# Using Full Stack Undertow
<p>Read on to get an overview of how to retrieve and create data from our API.</p>
<p>All of the following addresses assume you are using one of the following domains:</p>
<p>localhost:3000</p>
<p>or</p>
<p>blacajojo.herokuapp.com</p>

## Viewing all members
<p>Point your browser to:</p>
<p>/members</p>

## Viewing all questions
<p>Point your browser to:</p>
<p>/questions</p>

## Viewing all answers
<p>Point your browser to:</p>
<p>/answers</p>

## Viewing a specific member
<p>Point your browser to:</p>
<p>/members/[member_id]</p>
<p>where [member_id] is an integer referring to the member id</p>

## Viewing a specific question
<p>Point your browser to</p>
<p>/questions/[question_id]</p>
<p>where [question_id] is an integer referring to the member id</p>


## Viewing a specific answer
<p>Point your browser to</p>
<p>/answers/[answer_id]</p>
<p>where [answer_id] is an integer referring to the member id</p>


## Creating a member
<p>Strong params permit name, email and password in order to create a member.</p>
<p>After entering the domain address, add the following parameter format:</p>
<p>/members?name="You"&email="Your@email.com"&password="password"</p>
<p>Route table:</p>

    members GET    /members(.:format)            members#index
            POST   /members(.:format)            members#create
    member  GET    /members/:id(.:format)        members#show


## Creating a question
<p>Required fields: member_id, title and desc (description) in order to create a question.</p>
<p>Also token validation only allows users who are logged in to create a question / answer / or vote.</p>
<p>localhost3000/questions?member_id=1&title="Title"&desc="Description of your question."</p>
<p>Route table:</p>


    question  GET    /questions/:id(.:format)      questions#show
    questions GET    /questions(.:format)          questions#index
              POST   /questions(.:format)          questions#create

## Creating an answer
<p>Required fields: question_id, member_id, desc (description), and accepted (if the owner of the question has accepted this answer to be a valid fix for the problem)</p>
<p>A token is required in order to create an answer.</p>
localhost3000/answeers?question_id=1&member_id=1&desc="description of your answer"&accepted=true</p>
<p>Route table:</p>


    answer  GET    /answers/:id(.:format)        answers#show
            POST   /answers(.:format)            answers#create

## Creating a vote
<p>Required fields: member_id, up_down (if it is voted up or down), vote_for_id (foreign key depending on type), vote_for_type (wether its a question of answer)</p>
<p>A token is required in order to create an vote</p>
<p>localhost3000/votes?member_id=1&up_down=true&vote_for_id=1&vote_for_type="answer"</p>
<p>Route table:</p>


    POST   /votes(.:format)              votes#create

## Workflow
[Download PDF version of workflow diagram](https://github.com/BlaCaJoJo/api/files/20310/BlaCaJoJo.pdf)

## FEE site
[Stack Undertow Front End](https://blacajojo--gui.firebaseapp.com/index.html)
