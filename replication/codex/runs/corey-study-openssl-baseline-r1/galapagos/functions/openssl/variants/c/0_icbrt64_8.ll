; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-openssl-baseline-r1/functions/openssl/variants/c/0_icbrt64_8.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-openssl-baseline-r1/functions/openssl/variants/c/0_icbrt64_8.c"
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
  %remainder = alloca i64, align 8
  %group = alloca i32, align 4
  %trial = alloca i64, align 8
  %take = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 0, ptr %r, align 8
  store i64 0, ptr %remainder, align 8
  store i32 22, ptr %group, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, ptr %group, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, ptr %group, align 4
  %dec = add i32 %1, -1
  store i32 %dec, ptr %group, align 4
  %2 = load i64, ptr %remainder, align 8
  %mul = mul i64 %2, 8
  %3 = load i64, ptr %x.addr, align 8
  %4 = load i32, ptr %group, align 4
  %mul1 = mul i32 %4, 3
  %sh_prom = zext i32 %mul1 to i64
  %shr = lshr i64 %3, %sh_prom
  %and = and i64 %shr, 7
  %add = add i64 %mul, %and
  store i64 %add, ptr %remainder, align 8
  %5 = load i64, ptr %r, align 8
  %mul2 = mul i64 12, %5
  %6 = load i64, ptr %r, align 8
  %mul3 = mul i64 %mul2, %6
  %7 = load i64, ptr %r, align 8
  %mul4 = mul i64 6, %7
  %add5 = add i64 %mul3, %mul4
  %add6 = add i64 %add5, 1
  store i64 %add6, ptr %trial, align 8
  %8 = load i64, ptr %remainder, align 8
  %9 = load i64, ptr %trial, align 8
  %cmp7 = icmp uge i64 %8, %9
  %conv = zext i1 %cmp7 to i32
  %conv8 = sext i32 %conv to i64
  store i64 %conv8, ptr %take, align 8
  %10 = load i64, ptr %trial, align 8
  %11 = load i64, ptr %take, align 8
  %mul9 = mul i64 %10, %11
  %12 = load i64, ptr %remainder, align 8
  %sub = sub i64 %12, %mul9
  store i64 %sub, ptr %remainder, align 8
  %13 = load i64, ptr %r, align 8
  %mul10 = mul i64 2, %13
  %14 = load i64, ptr %take, align 8
  %add11 = add i64 %mul10, %14
  store i64 %add11, ptr %r, align 8
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %15 = load i64, ptr %r, align 8
  %shl = shl i64 %15, 12
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
