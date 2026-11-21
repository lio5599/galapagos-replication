; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r2/functions/ffmpeg/variants/c/1_mix_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r2/functions/ffmpeg/variants/c/1_mix_3.c"
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
  %result = alloca i32, align 4
  %channel = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %scale = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  store i32 0, ptr %result, align 4
  store i32 2, ptr %channel, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %channel, align 4
  %cmp = icmp sge i32 %0, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %channel, align 4
  %cmp1 = icmp eq i32 %1, 2
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %2 = load i32, ptr %c0.addr, align 4
  %shr = ashr i32 %2, 10
  store i32 %shr, ptr %a, align 4
  %3 = load i32, ptr %c1.addr, align 4
  %shr2 = ashr i32 %3, 10
  store i32 %shr2, ptr %b, align 4
  store i32 1024, ptr %scale, align 4
  br label %if.end11

if.else:                                          ; preds = %for.body
  %4 = load i32, ptr %channel, align 4
  %cmp3 = icmp eq i32 %4, 1
  br i1 %cmp3, label %if.then4, label %if.else8

if.then4:                                         ; preds = %if.else
  %5 = load i32, ptr %c0.addr, align 4
  %and = and i32 %5, 992
  %shr5 = ashr i32 %and, 5
  store i32 %shr5, ptr %a, align 4
  %6 = load i32, ptr %c1.addr, align 4
  %and6 = and i32 %6, 992
  %shr7 = ashr i32 %and6, 5
  store i32 %shr7, ptr %b, align 4
  store i32 32, ptr %scale, align 4
  br label %if.end

if.else8:                                         ; preds = %if.else
  %7 = load i32, ptr %c0.addr, align 4
  %and9 = and i32 %7, 31
  store i32 %and9, ptr %a, align 4
  %8 = load i32, ptr %c1.addr, align 4
  %and10 = and i32 %8, 31
  store i32 %and10, ptr %b, align 4
  store i32 1, ptr %scale, align 4
  br label %if.end

if.end:                                           ; preds = %if.else8, %if.then4
  br label %if.end11

if.end11:                                         ; preds = %if.end, %if.then
  %9 = load i32, ptr %a, align 4
  %mul = mul nsw i32 2, %9
  %10 = load i32, ptr %b, align 4
  %add = add nsw i32 %mul, %10
  %div = sdiv i32 %add, 3
  %11 = load i32, ptr %scale, align 4
  %mul12 = mul nsw i32 %div, %11
  %12 = load i32, ptr %result, align 4
  %add13 = add nsw i32 %12, %mul12
  store i32 %add13, ptr %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end11
  %13 = load i32, ptr %channel, align 4
  %dec = add nsw i32 %13, -1
  store i32 %dec, ptr %channel, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %14 = load i32, ptr %result, align 4
  ret i32 %14
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
