; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-cot-r3/functions/alsa-lib/variants/c/0_alaw_to_s16_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-cot-r3/functions/alsa-lib/variants/c/0_alaw_to_s16_8.c"
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
  %decoded = alloca i32, align 4
  %code = alloca i32, align 4
  %magnitude = alloca i32, align 4
  %scale = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %decoded, align 4
  %1 = load i32, ptr %decoded, align 4
  %and = and i32 %1, 127
  store i32 %and, ptr %code, align 4
  %2 = load i32, ptr %code, align 4
  %cmp = icmp slt i32 %2, 32
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load i32, ptr %code, align 4
  %mul = mul nsw i32 %3, 16
  %add = add nsw i32 %mul, 8
  store i32 %add, ptr %magnitude, align 4
  br label %if.end30

if.else:                                          ; preds = %entry
  %4 = load i32, ptr %code, align 4
  %cmp2 = icmp slt i32 %4, 48
  br i1 %cmp2, label %if.then4, label %if.else5

if.then4:                                         ; preds = %if.else
  store i32 2, ptr %scale, align 4
  br label %if.end25

if.else5:                                         ; preds = %if.else
  %5 = load i32, ptr %code, align 4
  %cmp6 = icmp slt i32 %5, 64
  br i1 %cmp6, label %if.then8, label %if.else9

if.then8:                                         ; preds = %if.else5
  store i32 4, ptr %scale, align 4
  br label %if.end24

if.else9:                                         ; preds = %if.else5
  %6 = load i32, ptr %code, align 4
  %cmp10 = icmp slt i32 %6, 80
  br i1 %cmp10, label %if.then12, label %if.else13

if.then12:                                        ; preds = %if.else9
  store i32 8, ptr %scale, align 4
  br label %if.end23

if.else13:                                        ; preds = %if.else9
  %7 = load i32, ptr %code, align 4
  %cmp14 = icmp slt i32 %7, 96
  br i1 %cmp14, label %if.then16, label %if.else17

if.then16:                                        ; preds = %if.else13
  store i32 16, ptr %scale, align 4
  br label %if.end22

if.else17:                                        ; preds = %if.else13
  %8 = load i32, ptr %code, align 4
  %cmp18 = icmp slt i32 %8, 112
  br i1 %cmp18, label %if.then20, label %if.else21

if.then20:                                        ; preds = %if.else17
  store i32 32, ptr %scale, align 4
  br label %if.end

if.else21:                                        ; preds = %if.else17
  store i32 64, ptr %scale, align 4
  br label %if.end

if.end:                                           ; preds = %if.else21, %if.then20
  br label %if.end22

if.end22:                                         ; preds = %if.end, %if.then16
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then12
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.then8
  br label %if.end25

if.end25:                                         ; preds = %if.end24, %if.then4
  %9 = load i32, ptr %code, align 4
  %and26 = and i32 %9, 15
  %mul27 = mul nsw i32 %and26, 16
  %add28 = add nsw i32 %mul27, 264
  %10 = load i32, ptr %scale, align 4
  %mul29 = mul nsw i32 %add28, %10
  store i32 %mul29, ptr %magnitude, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.end25, %if.then
  %11 = load i32, ptr %decoded, align 4
  %and31 = and i32 %11, 128
  %tobool = icmp ne i32 %and31, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end30
  %12 = load i32, ptr %magnitude, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end30
  %13 = load i32, ptr %magnitude, align 4
  %sub = sub nsw i32 0, %13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %12, %cond.true ], [ %sub, %cond.false ]
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
