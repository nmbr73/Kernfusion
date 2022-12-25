---
title: Expressions
alias: Expressions
---

Expressions are [[Lua]] code. Create for example a [[Text+]] [[Node]]. In the [[Inspector panel]] of the Text+ open the context menu for the text field and select 'Expression'. As an expression copy'n'paste the following code ...
```lua
Text("This is Frame "..time.." of " ..comp.RenderEnd..".\n".."In der realen Welt ist es gerade\n"..os.date("%H Uhr %M und %S Sekunden")..".\nI'm running on\n"..jit.os.." on a "..jit.arch.." architecture.\nMy current font size is \nat about "..string.format("%.2f",self.Size)..".")
```

