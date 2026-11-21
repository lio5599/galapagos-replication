; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-openssl-cot-r2/functions/openssl/variants/c/0_icbrt64_6.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-openssl-cot-r2/functions/openssl/variants/c/0_icbrt64_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i64 @icbrt64(i64 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @icbrt64(i64 noundef %x) #0 {
entry:
  %x.addr = alloca i64, align 8
  %r = alloca i64, align 8
  %cube = alloca i64, align 8
  %difference = alloca i64, align 8
  %increment = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 0, ptr %r, align 8
  store i64 0, ptr %cube, align 8
  store i64 1, ptr %difference, align 8
  store i64 6, ptr %increment, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i64, ptr %x.addr, align 8
  %1 = load i64, ptr %cube, align 8
  %sub = sub i64 %0, %1
  %2 = load i64, ptr %difference, align 8
  %cmp = icmp uge i64 %sub, %2
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i64, ptr %difference, align 8
  %4 = load i64, ptr %cube, align 8
  %add = add i64 %4, %3
  store i64 %add, ptr %cube, align 8
  %5 = load i64, ptr %r, align 8
  %inc = add i64 %5, 1
  store i64 %inc, ptr %r, align 8
  %6 = load i64, ptr %increment, align 8
  %7 = load i64, ptr %difference, align 8
  %add1 = add i64 %7, %6
  store i64 %add1, ptr %difference, align 8
  %8 = load i64, ptr %increment, align 8
  %add2 = add i64 %8, 6
  store i64 %add2, ptr %increment, align 8
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %9 = load i64, ptr %r, align 8
  %shl = shl i64 %9, 12
  ret i64 %shl
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
