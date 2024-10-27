## Installation

```bash
# MacOS
# xcode-select --install
# FreeBSD
# sudo pkg install curl git
# Ubuntu
sudo apt-get install curl git

# Git setup
ssh-keygen
cat .ssh/id_ed25519.pub

# Copy into ssh keys on Github (navigate to the browser)
# Clone the repo
git clone https://github.com/benjaminmaccini/benjaminmaccini
cd benjaminmaccini

# Copy the directory
cp -R $(pwd)/.config/home-manager $HOME/.config

# Install nix and nix#home-manager
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# Install all the things
nix run home-manager/master -- init --switch -b backup
```

Keep things up to date with `home-manager switch` and the following
```
rsync -av --delete ~/.config/home-manager/ ~/benjaminmaccini/.config/home-manager/
```

## Notes

Graphical applications that require the GPU (Zed, kitty, etc...) should be manually installed
since home-manager lacks the permissions to handle system setup.

## Hardware

Things change a lot here, but I generally have two setups:
    - Keyboards:
    	- Apple Magic Keyboard
    	- [Mistel MD600v3](https://mistelkeyboard.com/products/d7283e95f4ffcbc7b90f2dc54d1a0468)
    - Mouse: [Logitech G502 Hero](https://www.logitechg.com/en-us/products/gaming-mice/g502-hero-gaming-mouse.910-005469.html)
    - Computers:
    	- Onyx Boox Tab Ultra
      - 2016 Dell Inspiron 7368 2in1
        - 8.0 GiB
       	- Intel® Core™ i5-6200U CPU
     	- 2014 Mac Mini
      	- 8.0 GiB
      	- Intel® Core™ i5-4278U CPU @ 2.60GHz × 4
    	- Home Server: Raspberry Pi 4 (pihole + tailscale)
    - Phone: iPhone 15
    - Analog: Composite notebooks

## Workflows/Ideologies

**Applications-** Use native applications where possible and limit the urge to install non-base applications.
For the most part, these applications function just fine and any additional features that a custom application provides is generally
outweighed by the cost of maintenance for that application.

**Note taking -** I used to use Apple notes because it worked well and was simple. This helped me get organized,
but now that I use Ubuntu as my primary OS I needed something a bit better than logging onto icloud.com to access my
notes. I use Obsidian notes and pay for the sync functionality. Some considerations:
- I keep a few long-lived notes for frequently revisited items (TODOs, travel plans, useful code snippits).
- Use _dated_ call notes with the outcome, people involved and agenda.
- Don't think too hard on where a note should go. If something isn't where you think it should be, you can always fuzzy search for it.
- Digital notes are good, but any hard thinking and in person conversations should be done with pen and paper. For physical notes, do not
organize, just keep it as a dated, append-only log of ideas, events, etc...

**Code Editing -**
As it stands at the end of 2024, I use Zed as my primary with Vim keybindings for large projects and vim with a small [config](/.vimrc). Here are some guiding principles:
- An editor is no replacement for _good dev tooling_. As a bonus, focusing on tooling allows for standardization amongst programmers in an organization.
- Must-haves for coding
	- Fuzzy searching
	- Go to definition
	- Responsiveness
	- Bulk actions
	- Keyboard navigation
	- Automatic file backups
- Editors function within a context. Do I need to do some adhoc scripting in the terminal or do I need to do a large codebase refactoring? What language am I working
with, because particular editors can be _instructive_ when learning a new langauge.
- Avoid using task runners that are built into the IDE. It just adds a layer of abstraction that is confusing rather than convenient.


Other editors are fun to explore. But they provide marginal improvements for me. Here are my brief thoughts on those:
- Helix: Really easy to set up and use. Key bindings are great but I had to install a separate terminal for color support and certain key bindings. The window navigation command (Ctrl-W) is too close to application window close (Cmd+W). I lost a good amount of unsaved work due to fat-thumbing and never looked back.
- Neovim + fuckton of plugins: This has the biggest learning curve for any editor, but I'm glad I learned about things like LSP. I like the pseudo-IDE capabilty. Really no big complaints other than it is easy to bikeshed.
- nano: Only good for sshing into raw systems that don't have vim.
- Sublime: Somewhere between an IDE and a text editor. I used this a bunch back in university and it really blew my mind, that that level of software quality could be free. I've revisited over the years, but the multi-cursor is the only feature I really see as significant. Plus, to this day, the package management sketches me out.
- Jetbrains/Pycharm: This is what I used for the majority of my career. It is really great, but can be insanely slow.

**Dev Tools -** I mention above that dev tools are important. In any project, collaborative or personal, I need the following in order to have a standardized working environment:

- A task runner. I shove a square-shaped Makefile into this round hole and it works just fine.
- Automated test suite with good coverage
- CI/CD!!! Deploys done via GitOps, everything runs tests in a standardized environment.
- Formatter(s). Language specific
- Type checker
- A good gitignore file
- A database client with autocompletion
- Shell completion and reverse-searching
- Centralized documentation. For APIs, those should be self-documenting.

**Security and Privacy -** Some advice I got back in school was "never roll your own crypto." This doesn't really have to do with that advice, but generally speaking, I don't like clobbering together a bunch of systems that are security sensitive. I use Apple because I trust them to keep my content (passwords, cloud files, notes, etc...) safe, it's easily accessible across devices with no configuration and they have decent recovery options if I were to lose access. Anything that is _really_ sensitive doesn't get backed up to the cloud and I keep copies on different physical media. For privacy, I use PiHole running on a Tailscale network. It was easy enough to set up, and I noticed a slight speed improvement over client Ad blockers. Once Safari can install uBlock Origin, I will be content.

**Personal Productivity -** Here are some things I do to try and stay productive.

- Some things are meant to be ephemeral. I have <50 emails at any given moment, text messages are removed after a month, I don't save most links I visit, I aggresively prune accounts and services.
- Use a heirarchical system for organizing knowledge. Tag based systems and knowledge graphs might look cool, but I don't think my brain works like that. Bookmarks, screenshots, notes, file system, emails all live in folders in folders.
- Be kind to yourself. You cannot be productive all the time. I have weeks sometimes where I am a 10x programmer, others where I am a 0.1x programmer and most where I am simply a 1x programmer... I guess just simply a programmer.
- It is easy for me to get caught in the details of a workflow especially since I enjoy productivity optimization as a procrastination activity. Are the solutions I use OSS? Not enough probably. Am I spending too many keystrokes on my actions? Absolutely. Am I going too minimalist and missing out on crazy features that will change my life? Perhaps. Will my content be accessible in 20 years? I think so, but I might be dead by then anyways.
- Learning shell programming is hard. Getting down the basics to where I can read a failing program and fix syntax issues, then just asking an LLM to generate the raw commands has drastically improved my productivity here.
- Productivity, usefulness, and urgency are products of capitalism. Not a cop-out, but an explanation. I was born into a world where everything needs to be optimized and where progress is measured by achievement. I sure that I would be a lot happier once I learn to let that go.
- Productivity starts with health. Frequent breaks, eating healthy, cooking for yourself, prioritizing sleep over _everything_, exercise, socializing. It's really the only way to maintain any level of sanity.
