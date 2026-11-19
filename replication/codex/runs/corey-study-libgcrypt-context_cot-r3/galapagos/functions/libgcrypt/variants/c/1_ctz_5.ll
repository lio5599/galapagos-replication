; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-context_cot-r3/functions/libgcrypt/variants/c/1_ctz_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-context_cot-r3/functions/libgcrypt/variants/c/1_ctz_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ctz(i64 noundef %in) #0 {
entry:
  %in.addr = alloca i64, align 8
  %mask = alloca i64, align 8
  %i = alloca i32, align 4
  %r = alloca i32, align 4
  store i64 %in, ptr %in.addr, align 8
  store i32 0, ptr %r, align 4
  %0 = load i64, ptr %in.addr, align 8
  %shl = shl i64 %0, 1
  %1 = load i64, ptr %in.addr, align 8
  %or = or i64 %1, %shl
  store i64 %or, ptr %in.addr, align 8
  %2 = load i64, ptr %in.addr, align 8
  %shl1 = shl i64 %2, 2
  %3 = load i64, ptr %in.addr, align 8
  %or2 = or i64 %3, %shl1
  store i64 %or2, ptr %in.addr, align 8
  %4 = load i64, ptr %in.addr, align 8
  %shl3 = shl i64 %4, 4
  %5 = load i64, ptr %in.addr, align 8
  %or4 = or i64 %5, %shl3
  store i64 %or4, ptr %in.addr, align 8
  %6 = load i64, ptr %in.addr, align 8
  %shl5 = shl i64 %6, 8
  %7 = load i64, ptr %in.addr, align 8
  %or6 = or i64 %7, %shl5
  store i64 %or6, ptr %in.addr, align 8
  %8 = load i64, ptr %in.addr, align 8
  %shl7 = shl i64 %8, 16
  %9 = load i64, ptr %in.addr, align 8
  %or8 = or i64 %9, %shl7
  store i64 %or8, ptr %in.addr, align 8
  %10 = load i64, ptr %in.addr, align 8
  %shl9 = shl i64 %10, 32
  %11 = load i64, ptr %in.addr, align 8
  %or10 = or i64 %11, %shl9
  store i64 %or10, ptr %in.addr, align 8
  %12 = load i64, ptr %in.addr, align 8
  %not = xor i64 %12, -1
  store i64 %not, ptr %mask, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %13 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %13, 64
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %14 = load i64, ptr %mask, align 8
  %and = and i64 %14, 1
  %conv = trunc i64 %and to i32
  %15 = load i32, ptr %r, align 4
  %add = add nsw i32 %15, %conv
  store i32 %add, ptr %r, align 4
  %16 = load i64, ptr %mask, align 8
  %shr = lshr i64 %16, 1
  store i64 %shr, ptr %mask, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i32, ptr %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %18 = load i32, ptr %r, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @ctz(i64 noundef 0)
  ret i32 0
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
