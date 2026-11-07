; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context_cot-r3/functions/alsa-lib/variants/c/0_alaw_to_s16_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context_cot-r3/functions/alsa-lib/variants/c/0_alaw_to_s16_4.c"
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
  %code = alloca i32, align 4
  %base = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %and = and i32 %1, 127
  store i32 %and, ptr %code, align 4
  %2 = load i32, ptr %code, align 4
  %and1 = and i32 %2, 15
  %mul = mul nsw i32 %and1, 16
  %add = add nsw i32 %mul, 264
  store i32 %add, ptr %base, align 4
  %3 = load i32, ptr %code, align 4
  %cmp = icmp slt i32 %3, 16
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load i32, ptr %code, align 4
  %mul3 = mul nsw i32 %4, 16
  %add4 = add nsw i32 %mul3, 8
  store i32 %add4, ptr %t, align 4
  br label %if.end39

if.else:                                          ; preds = %entry
  %5 = load i32, ptr %code, align 4
  %cmp5 = icmp slt i32 %5, 32
  br i1 %cmp5, label %if.then7, label %if.else8

if.then7:                                         ; preds = %if.else
  %6 = load i32, ptr %base, align 4
  store i32 %6, ptr %t, align 4
  br label %if.end38

if.else8:                                         ; preds = %if.else
  %7 = load i32, ptr %code, align 4
  %cmp9 = icmp slt i32 %7, 48
  br i1 %cmp9, label %if.then11, label %if.else12

if.then11:                                        ; preds = %if.else8
  %8 = load i32, ptr %base, align 4
  %shl = shl i32 %8, 1
  store i32 %shl, ptr %t, align 4
  br label %if.end37

if.else12:                                        ; preds = %if.else8
  %9 = load i32, ptr %code, align 4
  %cmp13 = icmp slt i32 %9, 64
  br i1 %cmp13, label %if.then15, label %if.else17

if.then15:                                        ; preds = %if.else12
  %10 = load i32, ptr %base, align 4
  %shl16 = shl i32 %10, 2
  store i32 %shl16, ptr %t, align 4
  br label %if.end36

if.else17:                                        ; preds = %if.else12
  %11 = load i32, ptr %code, align 4
  %cmp18 = icmp slt i32 %11, 80
  br i1 %cmp18, label %if.then20, label %if.else22

if.then20:                                        ; preds = %if.else17
  %12 = load i32, ptr %base, align 4
  %shl21 = shl i32 %12, 3
  store i32 %shl21, ptr %t, align 4
  br label %if.end35

if.else22:                                        ; preds = %if.else17
  %13 = load i32, ptr %code, align 4
  %cmp23 = icmp slt i32 %13, 96
  br i1 %cmp23, label %if.then25, label %if.else27

if.then25:                                        ; preds = %if.else22
  %14 = load i32, ptr %base, align 4
  %shl26 = shl i32 %14, 4
  store i32 %shl26, ptr %t, align 4
  br label %if.end34

if.else27:                                        ; preds = %if.else22
  %15 = load i32, ptr %code, align 4
  %cmp28 = icmp slt i32 %15, 112
  br i1 %cmp28, label %if.then30, label %if.else32

if.then30:                                        ; preds = %if.else27
  %16 = load i32, ptr %base, align 4
  %shl31 = shl i32 %16, 5
  store i32 %shl31, ptr %t, align 4
  br label %if.end

if.else32:                                        ; preds = %if.else27
  %17 = load i32, ptr %base, align 4
  %shl33 = shl i32 %17, 6
  store i32 %shl33, ptr %t, align 4
  br label %if.end

if.end:                                           ; preds = %if.else32, %if.then30
  br label %if.end34

if.end34:                                         ; preds = %if.end, %if.then25
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.then20
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then15
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then11
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.then7
  br label %if.end39

if.end39:                                         ; preds = %if.end38, %if.then
  %18 = load i32, ptr %x, align 4
  %and40 = and i32 %18, 128
  %tobool = icmp ne i32 %and40, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end39
  %19 = load i32, ptr %t, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end39
  %20 = load i32, ptr %t, align 4
  %sub = sub nsw i32 0, %20
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %19, %cond.true ], [ %sub, %cond.false ]
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
