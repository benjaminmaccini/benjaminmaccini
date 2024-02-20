## Installation

Simply run `make` in the current directory. FreeBSD users will need to install/use the GNU version, `gmake`

After installation, you need to open vim and run `:PlugInstall`

## Hardware

Things change a lot here, but I generally have two setups:

- Home
    - Keyboard: [Mistel MD600v3](https://mistelkeyboard.com/products/d7283e95f4ffcbc7b90f2dc54d1a0468)
    - Mouse: [Logitech G502 Hero](https://www.logitechg.com/en-us/products/gaming-mice/g502-hero-gaming-mouse.910-005469.html)
    - Computers: Raspberry Pi 4 (pihole + tailscale)
    - Other: [Shoebox](https://www.outdoorgearlab.com/reviews/climbing/climbing-shoes-womens/scarpa-furia-s) for my computer to sit on so my neck doesn't hurt, glasses so my eyes don't hurt
- Travel
    - Keyboard: Apple Magic Keyboard
    - Mouse: Logitech M858
    - Computers: Onyx Boox Tab Ultra, FreeBSD server on Vultr
- Both
    - Phone: iPhone 15 with Compass phone stand
    - Analog: Paper + [Fisher Space Pen](https://www.spacepen.com) (because refills are accessible and it writes nicely)


## Workflows/Ideologies

**Applications-** Use native applications where possible. Instead of installing custom clients for terminal, 
mail, browser, calendar, diagramming, text editing, password management, etc... just use the base clients 
that come installed for those utilities. For the most part, these applications function just fine and any 
additional features that a custom application provides is generally outweighed by the cost of maintenance 
for that application.

**Note taking -** I use Apple notes for my note taking because it has rich text formatting, supports inline
pictures, and syncs between all my devices. Sometimes I wish I could use a Markdown-based solution, but not
so much. If I ever need to switch I can export the notes. My notes are organized using a modified Dewey
Decimal like system (10 categories that contain 10 sub categories). I stole this idea from somewhere, and it
isn't super helpful, but sometimes I can reference things for work based on the number, which is nice. Some
considerations:

- I keep a few long-lived notes for frequently revisited items (TODOs, travel plans, useful code snippits).
- Use _dated_ call notes with the outcome, people involved and agenda.
- Don't think too hard on where a note should go. If something isn't where you think it should be, you can always fuzzy search for it.
- Digital notes are good, but any hard thinking and in person conversations should be done with pen and paper.

**Code Editing -** This is the majority of my workflow optimization and I could write about it forever. I'll try to keep it brief. I use the base Mac install of Vim with a custom [.vimrc](.vimrc). Cutting to the chase, I prefer my editors doing one thing well and find that _good dev tooling_ in conjuction with an editor can provide an IDE like experience with standardization among programmers in an organization.

I have used almost everything (NeoVim, Jetbrains' IDEs, Sublime Text, helix, Kakoune, nano, VS Code, Notepad++, Eclipse) and still love checking out new options. When it comes to editing a large codebase, here are some things I couldn't live without (along with the Vim implementation):

- Fuzzy searching ([fzf](https://github.com/junegunn/fzf))
- Go to definition ([ctags](https://ctags.io))
- Responsiveness
- Bulk actions (sed)
- Keyboard navigation (binding improvements)
- Custom Commands (marcos, shell commands)
- File backups

Out-of-the-box IDEs are great for all of these, especially the bulk actions for large refactors. Where they fail in keyboard navigation, I can always add plugins. I used Pycharm+VimIdea in this fashion for most of my career. Where they fail miserably is responsiveness. I think this is from the number of bundled features that they contain (inline linting, database clients, constant reindexing for code actions, themes). On top of that, I always found it confusing when IDEs integrate with a certain technology and provide an "easy" way to execute that. Task runners in Jetbrains for building/running projects could magically succeed, while executing commands from the command line would fail. I really like knowing exactly what I am executing. It's worth noting that IDEs are _great_ for learning a new language.

Other editors are fun to explore. But they provide marginal improvements for me. Here are my brief thoughts on those:
- Helix: Really easy to set up and use. Key bindings are great but I had to install a separate terminal for color support and certain key bindings. The window navigation command (Ctrl-W) is too close to application window close (Cmd+W). I lost a good amount of unsaved work due to fat-thumbing and never looked back. 
- Neovim: This has the biggest learning curve for any editor, but I'm glad I learned about things like LSP. I like the pseudo-IDE capabilty. Really no big complaints, other than I like working with the pre-installed applications.
- nano: Only good for sshing into raw systems that don't have vim.
- Sublime: Somewhere between an IDE and a text editor. I used this a bunch back in university and it really blew my mind, that that level of software quality could be free. I've revisited over the years, but the multi-cursor is the only feature I really see as significant. Plus, to this day, the package management sketches me out.

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
- Be kind to yourself. You cannot be productive all the time. I have weeks sometimes where I am a 10x programmer, others where I am a 0.1x programmer and most where I am sitting in the middle.
- It is easy for me to get caught in the details of a workflow especially since I enjoy productivity optimization as a procrastination activity. Are the solutions I use OSS? Not enough probably. Am I spending too many keystrokes on my actions? Absolutely. Am I going too minimalist and missing out on crazy features that will change my life? Perhaps. Will my content be accessible in 20 years? I think so, but I might be dead by then anyways.
- Learning shell programming is hard. Getting down the basics to where I can read a failing program and fix syntax issues, then just asking ChatGPT to generate the raw commands has drastically improved my productivity here.
- Productivity, usefulness, and urgency are products of capitalism. Not a cop-out, but an explanation. I was born into a world where everything needs to be optimized and where progress is measured by achievement. I sure that I would be a lot happier once I learn to let that go.
