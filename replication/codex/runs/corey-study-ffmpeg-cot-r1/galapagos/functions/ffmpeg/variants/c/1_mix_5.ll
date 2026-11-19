; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r1/functions/ffmpeg/variants/c/1_mix_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r1/functions/ffmpeg/variants/c/1_mix_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @mix(i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @mix(i32 noundef %c0, i32 noundef %c1) #0 {
entry:
  %c0.addr = alloca i32, align 4
  %c1.addr = alloca i32, align 4
  %blue = alloca i32, align 4
  %green = alloca i32, align 4
  %red = alloca i32, align 4
  %b = alloca i32, align 4
  %g = alloca i32, align 4
  %bit = alloca i32, align 4
  %threshold = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %and = and i32 %0, 31
  %mul = mul nsw i32 2, %and
  %1 = load i32, ptr %c1.addr, align 4
  %and1 = and i32 %1, 31
  %add = add nsw i32 %mul, %and1
  store i32 %add, ptr %blue, align 4
  %2 = load i32, ptr %c0.addr, align 4
  %and2 = and i32 %2, 992
  %mul3 = mul nsw i32 2, %and2
  %3 = load i32, ptr %c1.addr, align 4
  %and4 = and i32 %3, 992
  %add5 = add nsw i32 %mul3, %and4
  %shr = ashr i32 %add5, 5
  store i32 %shr, ptr %green, align 4
  %4 = load i32, ptr %c0.addr, align 4
  %shr6 = ashr i32 %4, 10
  %mul7 = mul nsw i32 2, %shr6
  %5 = load i32, ptr %c1.addr, align 4
  %shr8 = ashr i32 %5, 10
  %add9 = add nsw i32 %mul7, %shr8
  store i32 %add9, ptr %red, align 4
  store i32 0, ptr %b, align 4
  store i32 0, ptr %g, align 4
  store i32 16, ptr %bit, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, ptr %bit, align 4
  %cmp = icmp ne i32 %6, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i32, ptr %bit, align 4
  %mul10 = mul nsw i32 3, %7
  store i32 %mul10, ptr %threshold, align 4
  %8 = load i32, ptr %blue, align 4
  %9 = load i32, ptr %threshold, align 4
  %cmp11 = icmp sge i32 %8, %9
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %10 = load i32, ptr %threshold, align 4
  %11 = load i32, ptr %blue, align 4
  %sub = sub nsw i32 %11, %10
  store i32 %sub, ptr %blue, align 4
  %12 = load i32, ptr %bit, align 4
  %13 = load i32, ptr %b, align 4
  %add12 = add nsw i32 %13, %12
  store i32 %add12, ptr %b, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %14 = load i32, ptr %green, align 4
  %15 = load i32, ptr %threshold, align 4
  %cmp13 = icmp sge i32 %14, %15
  br i1 %cmp13, label %if.then14, label %if.end17

if.then14:                                        ; preds = %if.end
  %16 = load i32, ptr %threshold, align 4
  %17 = load i32, ptr %green, align 4
  %sub15 = sub nsw i32 %17, %16
  store i32 %sub15, ptr %green, align 4
  %18 = load i32, ptr %bit, align 4
  %19 = load i32, ptr %g, align 4
  %add16 = add nsw i32 %19, %18
  store i32 %add16, ptr %g, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.then14, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end17
  %20 = load i32, ptr %bit, align 4
  %shr18 = ashr i32 %20, 1
  store i32 %shr18, ptr %bit, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %21 = load i32, ptr %red, align 4
  %div = sdiv i32 %21, 3
  %mul19 = mul nsw i32 %div, 1024
  %22 = load i32, ptr %g, align 4
  %mul20 = mul nsw i32 %22, 32
  %add21 = add nsw i32 %mul19, %mul20
  %23 = load i32, ptr %b, align 4
  %add22 = add nsw i32 %add21, %23
  ret i32 %add22
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
