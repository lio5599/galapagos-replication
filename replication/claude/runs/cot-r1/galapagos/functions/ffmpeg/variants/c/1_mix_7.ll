; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_7.c"
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
  %low = alloca i32, align 4
  %s = alloca i32, align 4
  %v = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  store i32 0, ptr %low, align 4
  store i32 0, ptr %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %s, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %c0.addr, align 4
  %2 = load i32, ptr %s, align 4
  %shr = ashr i32 %1, %2
  %and = and i32 %shr, 31
  %mul = mul nsw i32 2, %and
  %3 = load i32, ptr %c1.addr, align 4
  %4 = load i32, ptr %s, align 4
  %shr1 = ashr i32 %3, %4
  %and2 = and i32 %shr1, 31
  %add = add nsw i32 %mul, %and2
  store i32 %add, ptr %v, align 4
  %5 = load i32, ptr %v, align 4
  %div = sdiv i32 %5, 3
  %6 = load i32, ptr %s, align 4
  %shl = shl i32 %div, %6
  %7 = load i32, ptr %low, align 4
  %add3 = add nsw i32 %7, %shl
  store i32 %add3, ptr %low, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, ptr %s, align 4
  %add4 = add nsw i32 %8, 5
  store i32 %add4, ptr %s, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %9 = load i32, ptr %c0.addr, align 4
  %shr5 = ashr i32 %9, 10
  %mul6 = mul nsw i32 2, %shr5
  %10 = load i32, ptr %c1.addr, align 4
  %shr7 = ashr i32 %10, 10
  %add8 = add nsw i32 %mul6, %shr7
  %div9 = sdiv i32 %add8, 3
  %mul10 = mul nsw i32 %div9, 1024
  %11 = load i32, ptr %low, align 4
  %add11 = add nsw i32 %mul10, %11
  ret i32 %add11
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
