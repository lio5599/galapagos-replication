; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r1/functions/ffmpeg/variants/c/1_mix_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r1/functions/ffmpeg/variants/c/1_mix_9.c"
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
  %br = alloca i32, align 4
  %gr = alloca i32, align 4
  %bit = alloca i32, align 4
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
  store i32 0, ptr %br, align 4
  store i32 0, ptr %gr, align 4
  store i32 6, ptr %bit, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, ptr %bit, align 4
  %cmp = icmp sge i32 %6, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i32, ptr %br, align 4
  %mul10 = mul nsw i32 2, %7
  %8 = load i32, ptr %blue, align 4
  %9 = load i32, ptr %bit, align 4
  %shr11 = ashr i32 %8, %9
  %and12 = and i32 %shr11, 1
  %add13 = add nsw i32 %mul10, %and12
  store i32 %add13, ptr %br, align 4
  %10 = load i32, ptr %gr, align 4
  %mul14 = mul nsw i32 2, %10
  %11 = load i32, ptr %green, align 4
  %12 = load i32, ptr %bit, align 4
  %shr15 = ashr i32 %11, %12
  %and16 = and i32 %shr15, 1
  %add17 = add nsw i32 %mul14, %and16
  store i32 %add17, ptr %gr, align 4
  %13 = load i32, ptr %b, align 4
  %mul18 = mul nsw i32 %13, 2
  store i32 %mul18, ptr %b, align 4
  %14 = load i32, ptr %g, align 4
  %mul19 = mul nsw i32 %14, 2
  store i32 %mul19, ptr %g, align 4
  %15 = load i32, ptr %br, align 4
  %cmp20 = icmp sge i32 %15, 3
  br i1 %cmp20, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %16 = load i32, ptr %br, align 4
  %sub = sub nsw i32 %16, 3
  store i32 %sub, ptr %br, align 4
  %17 = load i32, ptr %b, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, ptr %b, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %18 = load i32, ptr %gr, align 4
  %cmp21 = icmp sge i32 %18, 3
  br i1 %cmp21, label %if.then22, label %if.end25

if.then22:                                        ; preds = %if.end
  %19 = load i32, ptr %gr, align 4
  %sub23 = sub nsw i32 %19, 3
  store i32 %sub23, ptr %gr, align 4
  %20 = load i32, ptr %g, align 4
  %inc24 = add nsw i32 %20, 1
  store i32 %inc24, ptr %g, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then22, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end25
  %21 = load i32, ptr %bit, align 4
  %dec = add nsw i32 %21, -1
  store i32 %dec, ptr %bit, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %22 = load i32, ptr %red, align 4
  %div = sdiv i32 %22, 3
  %mul26 = mul nsw i32 %div, 1024
  %23 = load i32, ptr %g, align 4
  %mul27 = mul nsw i32 %23, 32
  %add28 = add nsw i32 %mul26, %mul27
  %24 = load i32, ptr %b, align 4
  %add29 = add nsw i32 %add28, %24
  ret i32 %add29
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
