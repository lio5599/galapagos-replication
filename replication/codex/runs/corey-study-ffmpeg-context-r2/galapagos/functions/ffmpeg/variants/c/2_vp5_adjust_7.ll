; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-context-r2/functions/ffmpeg/variants/c/2_vp5_adjust_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-context-r2/functions/ffmpeg/variants/c/2_vp5_adjust_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @vp5_adjust(i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @vp5_adjust(i32 noundef %v, i32 noundef %t) #0 {
entry:
  %v.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %sign = alloca i32, align 4
  %a = alloca i32, align 4
  %twice = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %shr = ashr i32 %0, 31
  store i32 %shr, ptr %sign, align 4
  %1 = load i32, ptr %v.addr, align 4
  %2 = load i32, ptr %sign, align 4
  %xor = xor i32 %1, %2
  %3 = load i32, ptr %sign, align 4
  %sub = sub nsw i32 %xor, %3
  store i32 %sub, ptr %a, align 4
  %4 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %4
  store i32 %mul, ptr %twice, align 4
  %5 = load i32, ptr %twice, align 4
  store i32 %5, ptr %r, align 4
  %6 = load i32, ptr %t.addr, align 4
  %cmp = icmp sgt i32 %6, 0
  br i1 %cmp, label %if.then, label %if.end7

if.then:                                          ; preds = %entry
  store i32 0, ptr %r, align 4
  %7 = load i32, ptr %a, align 4
  %8 = load i32, ptr %twice, align 4
  %cmp1 = icmp slt i32 %7, %8
  br i1 %cmp1, label %if.then2, label %if.end6

if.then2:                                         ; preds = %if.then
  %9 = load i32, ptr %a, align 4
  store i32 %9, ptr %r, align 4
  %10 = load i32, ptr %a, align 4
  %11 = load i32, ptr %t.addr, align 4
  %cmp3 = icmp sgt i32 %10, %11
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then2
  %12 = load i32, ptr %twice, align 4
  %13 = load i32, ptr %a, align 4
  %sub5 = sub nsw i32 %12, %13
  store i32 %sub5, ptr %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then2
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %entry
  %14 = load i32, ptr %r, align 4
  %15 = load i32, ptr %sign, align 4
  %add = add nsw i32 %14, %15
  %16 = load i32, ptr %sign, align 4
  %xor8 = xor i32 %add, %16
  ret i32 %xor8
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
