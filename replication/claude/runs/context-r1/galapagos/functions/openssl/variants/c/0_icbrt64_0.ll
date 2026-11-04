; ModuleID = '/home/liolsen/galapagos-replication/functions/openssl/variants/c/0_icbrt64_0.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/openssl/variants/c/0_icbrt64_0.c"
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
  %b = alloca i64, align 8
  %s = alloca i32, align 4
  store i64 %x, ptr %x.addr, align 8
  store i64 0, ptr %r, align 8
  store i32 63, ptr %s, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, ptr %s, align 4
  %cmp = icmp sge i32 %0, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i64, ptr %r, align 8
  %mul = mul i64 %1, 2
  store i64 %mul, ptr %r, align 8
  %2 = load i64, ptr %r, align 8
  %mul1 = mul i64 3, %2
  %3 = load i64, ptr %r, align 8
  %add = add i64 %3, 1
  %mul2 = mul i64 %mul1, %add
  %add3 = add i64 %mul2, 1
  store i64 %add3, ptr %b, align 8
  %4 = load i64, ptr %x.addr, align 8
  %5 = load i32, ptr %s, align 4
  %sh_prom = zext i32 %5 to i64
  %shr = lshr i64 %4, %sh_prom
  %6 = load i64, ptr %b, align 8
  %cmp4 = icmp uge i64 %shr, %6
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %7 = load i64, ptr %x.addr, align 8
  %8 = load i64, ptr %b, align 8
  %9 = load i32, ptr %s, align 4
  %sh_prom5 = zext i32 %9 to i64
  %shl = shl i64 %8, %sh_prom5
  %sub = sub i64 %7, %shl
  store i64 %sub, ptr %x.addr, align 8
  %10 = load i64, ptr %r, align 8
  %add6 = add i64 %10, 1
  store i64 %add6, ptr %r, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %11 = load i32, ptr %s, align 4
  %sub7 = sub nsw i32 %11, 3
  store i32 %sub7, ptr %s, align 4
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %12 = load i64, ptr %r, align 8
  %shl8 = shl i64 %12, 12
  ret i64 %shl8
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
