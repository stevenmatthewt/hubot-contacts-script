# Description:
#   Modify contact information for a user and persist it in 'the brain'
#
# Commands:
#   hubot set my <email | Github username | CB username> to <whatever> - Sets your contact information
#   hubot get my <email | Github username | CB username> - Gets your contact information
#   hubot get all my contact information - Gets a list of all available contact information

module.exports = (robot) ->
  Contacts = require('hubot-contacts')(robot)

  robot.respond /(set my email to )(.*)/i, (msg) ->
  	if Contacts.set msg.message.user.id, 'email', msg.match[2]
      msg.reply 'Email successfuly updated!'
    else
      msg.reply 'Uh-oh! Something went wrong!'

  robot.respond /get my email/i, (msg) ->
  	email = Contacts.get msg.message.user.id, 'email'
  	if email
      msg.reply email
    else
      msg.reply 'You have not set an email yet!'

  robot.respond /(set my Github username to )(.*)/i, (msg) ->
  	if Contacts.set msg.message.user.id, 'githubUsername', msg.match[2]
      msg.reply 'Github username successfuly updated!'
    else
      msg.reply 'Uh-oh! Something went wrong!'

  robot.respond /get my Github username/i, (msg) ->
    githubUsername = Contacts.get msg.message.user.id, 'githubUsername'
    if githubUsername
      msg.reply githubUsername
    else
      msg.reply 'You have not set a Github username yet!'

  robot.respond /(set my CB username to )(.*)/i, (msg) ->
    if Contacts.set msg.message.user.id, 'cbUsername', msg.match[2]
      msg.reply 'CB username successfuly updated!'
    else
      msg.reply 'Uh-oh! Something went wrong!'

  robot.respond /get my CB username/i, (msg) ->
    cbUsername = Contacts.get msg.message.user.id, 'cbUsername'
    if cbUsername
      msg.reply cbUsername
    else
      msg.reply 'You have not set a CB username yet!'

  robot.respond /(get all my contact information)|(get \.some of my nformation)/i, (msg) ->
    info = Contacts.getAllInfo msg.message.user.id
    if info
      response = ' \n'
      for key, value of info
        response += "#{key} : #{value}\n"
      msg.reply response
    else
      msg.reply "You don't have any contact information!"


