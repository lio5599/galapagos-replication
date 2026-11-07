; ModuleID = '/home/cbh/galapagos-corey-runs/corey-alsa-baseline-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_0.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-alsa-baseline-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_0.c"
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
  %magnitude = alloca i32, align 4
  %segment = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  %conv1 = trunc i32 %xor to i8
  store i8 %conv1, ptr %a_val.addr, align 1
  %1 = load i8, ptr %a_val.addr, align 1
  %conv2 = zext i8 %1 to i32
  %shr = ashr i32 %conv2, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %segment, align 4
  %2 = load i8, ptr %a_val.addr, align 1
  %conv3 = zext i8 %2 to i32
  %and4 = and i32 %conv3, 15
  %shl = shl i32 %and4, 4
  store i32 %shl, ptr %magnitude, align 4
  %3 = load i32, ptr %segment, align 4
  %tobool = icmp ne i32 %3, 0
  %4 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i32 264, i32 8
  %5 = load i32, ptr %magnitude, align 4
  %add = add nsw i32 %5, %cond
  store i32 %add, ptr %magnitude, align 4
  %6 = load i32, ptr %segment, align 4
  %cmp = icmp sgt i32 %6, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load i32, ptr %segment, align 4
  %sub = sub nsw i32 %7, 1
  %8 = load i32, ptr %magnitude, align 4
  %shl6 = shl i32 %8, %sub
  store i32 %shl6, ptr %magnitude, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %9 = load i8, ptr %a_val.addr, align 1
  %conv7 = zext i8 %9 to i32
  %and8 = and i32 %conv7, 128
  %tobool9 = icmp ne i32 %and8, 0
  br i1 %tobool9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %10 = load i32, ptr %magnitude, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %11 = load i32, ptr %magnitude, align 4
  %sub10 = sub nsw i32 0, %11
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond11 = phi i32 [ %10, %cond.true ], [ %sub10, %cond.false ]
  ret i32 %cond11
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
