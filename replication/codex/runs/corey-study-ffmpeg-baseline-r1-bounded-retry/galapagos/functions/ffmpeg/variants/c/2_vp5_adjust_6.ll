; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-baseline-r1-bounded-retry/functions/ffmpeg/variants/c/2_vp5_adjust_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-baseline-r1-bounded-retry/functions/ffmpeg/variants/c/2_vp5_adjust_6.c"
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
  %limit = alloca i32, align 4
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
  store i32 %mul, ptr %limit, align 4
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %limit, align 4
  %cmp = icmp slt i32 %5, %6
  %conv = zext i1 %cmp to i32
  %7 = load i32, ptr %a, align 4
  %mul1 = mul nsw i32 %7, %conv
  store i32 %mul1, ptr %a, align 4
  %8 = load i32, ptr %a, align 4
  %9 = load i32, ptr %t.addr, align 4
  %cmp2 = icmp slt i32 %8, %9
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %10 = load i32, ptr %a, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %11 = load i32, ptr %limit, align 4
  %12 = load i32, ptr %a, align 4
  %sub4 = sub nsw i32 %11, %12
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %10, %cond.true ], [ %sub4, %cond.false ]
  store i32 %cond, ptr %r, align 4
  %13 = load i32, ptr %r, align 4
  %14 = load i32, ptr %sign, align 4
  %add = add nsw i32 %13, %14
  %15 = load i32, ptr %sign, align 4
  %xor5 = xor i32 %add, %15
  ret i32 %xor5
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
