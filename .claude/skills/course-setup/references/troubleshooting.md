# Troubleshooting

Symptom by symptom. Before any repair: commit the student's work (see
saving-work.md), and ask before changing anything beyond a normal save.
Rename instead of deleting. When a fix doesn't work, tell the student to post
in their course Slack channel: what they were trying to do, the exact error
message, and whether they're on a Mac or Windows.

Most fixes start with `bash <skill folder>/scripts/checkup.sh`.

## GitHub tool missing or not signed in

`CHECK2=fail:gh-missing` or `fail:not-signed-in`, or git says "Authentication
failed", "could not read Username", or "Permission denied" (403).

The GitHub tool (gh) lives in `~/.ccpm/gh` and keeps the student signed in.
It may be missing if the folder was renamed or another tool cleaned it up; the
sign-in may be gone if they signed out or GitHub ended it.

Fix: tell the student, "Your GitHub sign-in needs a refresh. Open a new
session in the Claude app, paste the course setup prompt again, and follow
it. It only redoes what's missing. Then come back to this folder and type:
check my setup." Don't sign them in yourself, and never ask for a password or
token.

## A Rook connector doesn't show up

This session has no rook-wiki or rook-database tools.

1. Check the folder: `CHECK1` must pass and the folder must have `.mcp.json`
   at its top. No `.mcp.json`? See "Repo created before the connectors".
2. The connectors load when a session starts, and only for the folder the
   session was opened on. Tell the student: "Start a new session: in the
   Claude app, go to the Code tab, click + New session, choose your course
   folder (<full path>) as the Project folder, and type: check my setup. If
   it asks whether to trust this folder, or whether to allow the rook-wiki
   and rook-database servers, say yes."
3. If they answered "no" to allowing the servers before, Claude Code
   remembers that in `.claude/settings.local.json` in the course folder
   (`disabledMcpjsonServers`). With their OK, rename that file to
   `settings.local-old.json` and start a new session.
4. Still missing: the computer may not reach the connectors (a company
   network can block them). Post in Slack with "Mac or Windows" and whether
   they're on a work network.

## A Rook connector is busy

The reply says "The Rook connector is busy right now. Wait a minute and try
again." or "The Rook wiki is not available yet. Try again in a few minutes."
This means it's busy, not broken: many students are using it at once, or the
wiki is being refreshed. Wait about 30 seconds and try again, up to 3 times.
Still busy: tell the student to try again in a few minutes. It isn't
anything on their computer.

## Wrong folder

`CHECK1=fail:not-a-repo` or `fail:inside-subfolder`, or the student opened
something like their home folder, a module folder, or an old unzipped copy of
the course.

Fix: "This session is open on the wrong folder. In the Claude app, go to the
Code tab, click + New session, choose <home folder>/claude-code-for-pms-final
as the Project folder, and type: check my setup." Write the path the way their
computer shows paths. If `claude-code-for-pms-final` doesn't exist in their
home folder, they need the setup prompt (first-time-setup.md).

If they have work in the wrong folder (for example, from an old unzipped
copy), ask whether they want it copied into the course folder. Copy, don't
move, and don't overwrite: a file that already exists in the course folder
gets the copy saved with `-old` added to its name.

## Linked to the course template

`CHECK1=fail:linked-to-template`. The folder is a copy of Product School's
course template, not the student's own repo, so their work can't be saved to
GitHub from here.

Fix: "This folder is linked to the course template instead of your own
GitHub repo. Open a new session on any other folder (your Documents folder is
fine), paste the course setup prompt, and follow it. It will set the old
folder aside as claude-code-for-pms-final-old and give you a fresh one linked
to your repo." Then offer to copy any work from the `-old` folder into the new
one (copy, don't overwrite, as in "Wrong folder").

## Linked to the wrong repo

`CHECK1=fail:not-linked`, `fail:linked-elsewhere`, or `fail:someone-elses-repo`
(the repo belongs to a different GitHub account than the one signed in), or
git says "Repository not found".

1. If `SIGNED_IN=yes`, check the student's repo exists:
   `<gh> repo view <GH_USER>/claude-code-for-pms-final --json url`.
2. It exists, and this folder is otherwise the course folder: with the
   student's OK, point the folder at it:
   `git remote set-url origin https://github.com/<GH_USER>/claude-code-for-pms-final.git`
   (or `git remote add origin …` if there's none). Then run
   `scripts/save.sh`, which merges anything already on GitHub.
3. It doesn't exist, or they signed in with a different account than the one
   they meant to use: the setup prompt fixes both. Tell them to run it again
   from a new session on another folder.

## Repo created before the connectors

The folder has no `.mcp.json`, or no `.claude/skills/course-setup/`, because
the student's repo was made from an older version of the course template.

Fix, with the student's OK:

1. Save their work first (`scripts/save.sh "Before course update"`).
2. `GIT_TERMINAL_PROMPT=0 git fetch https://github.com/Product-School-Platform/claude-code-for-pms-template.git main`
3. If `.mcp.json` or any file under `.claude/` that the template also has
   already exists here and is different, rename it with `-old` first and tell
   the student.
4. `git checkout FETCH_HEAD -- .mcp.json .claude`
5. `scripts/save.sh "Add the course connectors and setup skill"`.
6. Tell them to start a new session on the course folder and type: check my
   setup.

## Not on the main branch

`RESULT=detached`, or `git status` says "HEAD detached" or names a branch
other than main. Commit first (`git add -A`, `git commit -m "Save before
switching back"` works even when detached), then with their OK:
`git branch saved-work-old` (keeps that commit), `git checkout main`,
`git merge saved-work-old`, and save again. If the merge clashes, use
"Keeping both versions" in saving-work.md.

## Name or email not set

git says "Please tell me who you are" or "empty ident name". `save.sh` fixes
this itself when gh is signed in. If it reports `RESULT=no-identity`, fix the
sign-in first ("GitHub tool missing or not signed in").

## Something is in the way

A file or folder blocks a step (a leftover `claude-code-for-pms-final`, a
half-finished file). Rename it with `-old` on the end (or `-old-2`, `-old-3`
if that's taken) and tell the student what you renamed. Never delete it.

## Offline

"Could not resolve host", "Failed to connect", or timeouts. The work is safe
on this computer (it's committed). Tell the student to try "save my work"
again when they're back online.
