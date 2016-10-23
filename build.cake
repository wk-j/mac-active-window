Action<string> buildSwift = (name) => {
    var args = String.Format("build -C swift/{0}", name);
    StartProcess("swift", new ProcessSettings {
        Arguments = args
    });
};

Action<string, string> runSwift = (name,args) => {
    var command = String.Format("swift/{0}/.build/debug/{0}", name);
    StartProcess(command, new ProcessSettings {
        Arguments = args
    });
};

Action<string> runApple = (name) => {
    var command = String.Format("scripts/{0}.applescript", name);
    StartProcess("osascript", new ProcessSettings {
        Arguments = command
    });
};

Action<string> runSwiftScript = (name) => {
    var command = String.Format("scripts/{0}.swift", name);
    StartProcess("swift", new ProcessSettings {
        Arguments = command
    });
};

Action<string, string> buildCabon = (name, args) => {
    var exe = "carbon/" + name + ".bin";
    var command = String.Format("-framework Carbon -o {1} carbon/{0}.c", name, exe);
    StartProcess("gcc", new ProcessSettings {
        Arguments = command
    });
    StartProcess(exe, new ProcessSettings {
        Arguments = args
    });
};

Task("Default").Does(() => {});

Task("Build-ActiveWindow").Does(() => {
    buildSwift("ActiveWindow");
});

Task("Build-ScreenSize").Does(() => {
    buildSwift("ScreenSize");
});

Task("Build-ResizeWindow").Does(() => {
    buildSwift("ResizeWindow");
});

Task("Run-ResizeWindow")
    .IsDependentOn("Build-ResizeWindow")
    .Does(() => {
        runSwift("ResizeWindow", ""); 
});

Task("Script-Chrome").Does(() => runApple("chrome"));
Task("Script-Resize").Does(() => runApple("resize"));
Task("Script-Active").Does(() => runApple("active"));

Task("Swift-Hello").Does(() => runSwiftScript("hello"));
Task("Swift-Front").Does(() => runSwiftScript("front"));

Task("Cabon-Move").Does(() => buildCabon("move", ""));
Task("Cabon-Resize").Does(() => buildCabon("resize", "800 800"));

var target = Argument("target", "default");
RunTarget(target);