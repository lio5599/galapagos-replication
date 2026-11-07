; ModuleID = '/home/cbh/galapagos-corey-runs/corey-alsa-baseline-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-alsa-baseline-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_9.c"
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
  %code = alloca i32, align 4
  %segment = alloca i32, align 4
  %magnitude = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  %and = and i32 %xor, 127
  store i32 %and, ptr %code, align 4
  %1 = load i32, ptr %code, align 4
  %div = sdiv i32 %1, 16
  store i32 %div, ptr %segment, align 4
  %2 = load i32, ptr %code, align 4
  %rem = srem i32 %2, 16
  %mul = mul nsw i32 %rem, 16
  %add = add nsw i32 %mul, 8
  store i32 %add, ptr %magnitude, align 4
  %3 = load i32, ptr %segment, align 4
  %cmp = icmp ne i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i32, ptr %magnitude, align 4
  %add2 = add nsw i32 %4, 256
  store i32 %add2, ptr %magnitude, align 4
  %5 = load i32, ptr %segment, align 4
  switch i32 %5, label %sw.default [
    i32 7, label %sw.bb
    i32 6, label %sw.bb4
    i32 5, label %sw.bb6
    i32 4, label %sw.bb8
    i32 3, label %sw.bb10
    i32 2, label %sw.bb12
  ]

sw.bb:                                            ; preds = %if.then
  %6 = load i32, ptr %magnitude, align 4
  %mul3 = mul nsw i32 %6, 2
  store i32 %mul3, ptr %magnitude, align 4
  br label %sw.bb4

sw.bb4:                                           ; preds = %sw.bb, %if.then
  %7 = load i32, ptr %magnitude, align 4
  %mul5 = mul nsw i32 %7, 2
  store i32 %mul5, ptr %magnitude, align 4
  br label %sw.bb6

sw.bb6:                                           ; preds = %sw.bb4, %if.then
  %8 = load i32, ptr %magnitude, align 4
  %mul7 = mul nsw i32 %8, 2
  store i32 %mul7, ptr %magnitude, align 4
  br label %sw.bb8

sw.bb8:                                           ; preds = %sw.bb6, %if.then
  %9 = load i32, ptr %magnitude, align 4
  %mul9 = mul nsw i32 %9, 2
  store i32 %mul9, ptr %magnitude, align 4
  br label %sw.bb10

sw.bb10:                                          ; preds = %sw.bb8, %if.then
  %10 = load i32, ptr %magnitude, align 4
  %mul11 = mul nsw i32 %10, 2
  store i32 %mul11, ptr %magnitude, align 4
  br label %sw.bb12

sw.bb12:                                          ; preds = %sw.bb10, %if.then
  %11 = load i32, ptr %magnitude, align 4
  %mul13 = mul nsw i32 %11, 2
  store i32 %mul13, ptr %magnitude, align 4
  br label %sw.default

sw.default:                                       ; preds = %sw.bb12, %if.then
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default
  br label %if.end

if.end:                                           ; preds = %sw.epilog, %entry
  %12 = load i8, ptr %a_val.addr, align 1
  %conv14 = zext i8 %12 to i32
  %and15 = and i32 %conv14, 128
  %tobool = icmp ne i32 %and15, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %13 = load i32, ptr %magnitude, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %14 = load i32, ptr %magnitude, align 4
  %sub = sub nsw i32 0, %14
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %13, %cond.true ], [ %sub, %cond.false ]
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
