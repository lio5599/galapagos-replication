; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @alaw_to_s16(i8 noundef zeroext 97)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @alaw_to_s16(i8 noundef zeroext %a_val) #0 {
entry:
  %a_val.addr = alloca i8, align 1
  %x = alloca i32, align 4
  %seg = alloca i32, align 4
  %t = alloca i32, align 4
  %shift = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %shr = ashr i32 %1, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %seg, align 4
  %2 = load i32, ptr %seg, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load i32, ptr %x, align 4
  %and2 = and i32 %3, 15
  %shl = shl i32 %and2, 4
  %add = add nsw i32 %shl, 8
  store i32 %add, ptr %t, align 4
  br label %if.end19

if.else:                                          ; preds = %entry
  %4 = load i32, ptr %seg, align 4
  %sub = sub nsw i32 %4, 1
  store i32 %sub, ptr %shift, align 4
  %5 = load i32, ptr %x, align 4
  %and3 = and i32 %5, 15
  %shl4 = shl i32 %and3, 4
  %add5 = add nsw i32 %shl4, 264
  store i32 %add5, ptr %t, align 4
  %6 = load i32, ptr %shift, align 4
  %and6 = and i32 %6, 1
  %tobool = icmp ne i32 %and6, 0
  br i1 %tobool, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.else
  %7 = load i32, ptr %t, align 4
  %shl8 = shl i32 %7, 1
  store i32 %shl8, ptr %t, align 4
  br label %if.end

if.end:                                           ; preds = %if.then7, %if.else
  %8 = load i32, ptr %shift, align 4
  %and9 = and i32 %8, 2
  %tobool10 = icmp ne i32 %and9, 0
  br i1 %tobool10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %if.end
  %9 = load i32, ptr %t, align 4
  %shl12 = shl i32 %9, 2
  store i32 %shl12, ptr %t, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %if.end
  %10 = load i32, ptr %shift, align 4
  %and14 = and i32 %10, 4
  %tobool15 = icmp ne i32 %and14, 0
  br i1 %tobool15, label %if.then16, label %if.end18

if.then16:                                        ; preds = %if.end13
  %11 = load i32, ptr %t, align 4
  %shl17 = shl i32 %11, 4
  store i32 %shl17, ptr %t, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %if.end13
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.then
  %12 = load i32, ptr %x, align 4
  %and20 = and i32 %12, 128
  %tobool21 = icmp ne i32 %and20, 0
  br i1 %tobool21, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end19
  %13 = load i32, ptr %t, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end19
  %14 = load i32, ptr %t, align 4
  %sub22 = sub nsw i32 0, %14
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %13, %cond.true ], [ %sub22, %cond.false ]
  ret i32 %cond
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
