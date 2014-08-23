#!/bin/bash
# Helpful tools for GoodData with regard to the Ruby SDK.

PS3='Builder: '
printf "\033c"
trap "{ echo [GoodData] Exiting...; rm -f docs.zip ; rm -f sublime.dmg; exit 255; }" EXIT

echo ''
echo '====================='
echo 'GOODDATA Builder 2014'
echo '====================='
echo ''
printf '[GoodData] Welcome! Please choose an option.\n'
echo ''
options=("Install Brew, Git, RVM, Sublime and Ruby" "Scaffold GoodData Demo Project" "Load Demo S3 Data" "Quit")
select opt in "${options[@]}"
do
    case $opt in

        "Install Brew, Git, RVM, Sublime and Ruby")
            printf '[GoodData] To install some of the applications we will need sudo. Enter your computer password...'
            sudo echo "Thanks."

            # RVM
            printf "[GoodData] Installing RVM & Ruby\r"
            curl -sSL https://get.rvm.io | bash -s stable --ruby

            # Homebrew
            printf "[GoodData] Installing Homebrew...\r"
            ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

            # Git
            printf '[GoodData] Installing Github...\r'
            brew install git

            # Sublime
            printf "[GoodData] Installing Sublime Text 2..."
            curl -o sublime.dmg 'https://s3.amazonaws.com/xnh/sublime.dmg'
            hdiutil mount sublime.dmg
            sudo cp -R "/Volumes/Sublime Text 2/Sublime Text 2.app" /Applications
            rm -Rf sublime.dmg

            # Create link to Sublime Command Line Tool
            ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl

            printf "\n[GoodData] Complete!\n"
            ;;

        "Scaffold GoodData Demo Project")
            echo "[GoodData] Downloading Ruby SDK Builder"

            # Interactive will set up the Nitrous hack box. Not will scaffold project.
            read -p "Run interactivly? (y/n): " answer
            if [ "$answer" == y ] || [ "$answer" == "" ] || [ "$answer" == yes ] ; then
                printf '[GoodData] Downloading Ruby SDK Interactive Builder...\r'
                curl -o builder.rb 'https://raw.githubusercontent.com/thnkr/gooddata-ruby-box/master/builder.rb'
                printf '\r'
                ruby builder.rb
            else
                printf '[GoodData] Downloading Scaffold...\r'
                gem install gooddata
                gooddata scaffold project my_test_project
            fi
            printf "\n[GoodData] Complete!\n"
            ;;

        "Load Demo S3 Data")
            echo "[GoodData] It should curl the data from S3 or something here..."
            printf "\n[GoodData] Complete!\n"
            ;;

        "Quit")
            echo "[GoodData] Exiting..."
            rm -Rf builder.rb
            rm -Rf sublime.dmg
            break
            ;;
        *)
            printf '\nThat command was not recognized. Sorry.\n'
            echo ''
    esac
done
