# puppet-ntp-demo

Demo project to play with puppet and vanila ntp module

There is a vagrant machine setup to test my puppet project.
As you can see i have two enviranments with one lilttle difference
First of all I setup hierra to store my class parameters
There is on little modification in default yaml.file. It contain family os hierarhy folder
Because it is often when same service names or groups as my case are differs with os famailies, such as RedHat and Debian
And it is very convinient to have common parameters for it.

Lets look to my modules folder
I can find any better than just vanilla NTP service to work with.
Next move to modules/ntp folder.
Here is a simple module contains package-service-file classes
Usually its 80 % of all cases that puppet covers.

Init.pp contains package resource that install package. It also contains order derictive before 
that tell puppet to install package before run ntp::config class

Config class have 2 template engines ERB and EPP, that apears after puppet 4
You can use any of it actually. But for me ERB looks like more mature
With EPP it is more native with puppet tools such as validation and so on.
And it is also contain order derictive notify, that similar to before but also notify target class when change happends.

Next is a service that use hierra os families parameter to get service name and pass it to systemctl daemon



