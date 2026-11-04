; ModuleID = '/home/liolsen/galapagos-replication/functions/openssl/variants/c/0_icbrt64_4.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/openssl/variants/c/0_icbrt64_4.c"
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
  %bit = alloca i64, align 8
  %c = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 0, ptr %r, align 8
  store i64 2097152, ptr %bit, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i64, ptr %bit, align 8
  %cmp = icmp ne i64 %0, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i64, ptr %r, align 8
  %2 = load i64, ptr %bit, align 8
  %or = or i64 %1, %2
  store i64 %or, ptr %c, align 8
  %3 = load i64, ptr %c, align 8
  %cmp1 = icmp ule i64 %3, 2642245
  br i1 %cmp1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.body
  %4 = load i64, ptr %c, align 8
  %5 = load i64, ptr %c, align 8
  %mul = mul i64 %4, %5
  %6 = load i64, ptr %c, align 8
  %mul2 = mul i64 %mul, %6
  %7 = load i64, ptr %x.addr, align 8
  %cmp3 = icmp ule i64 %mul2, %7
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %8 = load i64, ptr %c, align 8
  store i64 %8, ptr %r, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %while.body
  %9 = load i64, ptr %bit, align 8
  %shr = lshr i64 %9, 1
  store i64 %shr, ptr %bit, align 8
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %10 = load i64, ptr %r, align 8
  %shl = shl i64 %10, 12
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
