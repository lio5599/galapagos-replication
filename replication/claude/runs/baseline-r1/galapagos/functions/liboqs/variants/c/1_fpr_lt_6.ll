; ModuleID = '/home/liolsen/galapagos-replication/functions/liboqs/variants/c/1_fpr_lt_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/liboqs/variants/c/1_fpr_lt_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %lt = alloca i64, align 8
  %gt = alloca i64, align 8
  %s = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  %not = xor i64 %0, -1
  %1 = load i64, ptr %y.addr, align 8
  %and = and i64 %not, %1
  %2 = load i64, ptr %x.addr, align 8
  %not1 = xor i64 %2, -1
  %3 = load i64, ptr %y.addr, align 8
  %or = or i64 %not1, %3
  %4 = load i64, ptr %x.addr, align 8
  %5 = load i64, ptr %y.addr, align 8
  %sub = sub i64 %4, %5
  %and2 = and i64 %or, %sub
  %or3 = or i64 %and, %and2
  %shr = lshr i64 %or3, 63
  store i64 %shr, ptr %lt, align 8
  %6 = load i64, ptr %y.addr, align 8
  %not4 = xor i64 %6, -1
  %7 = load i64, ptr %x.addr, align 8
  %and5 = and i64 %not4, %7
  %8 = load i64, ptr %y.addr, align 8
  %not6 = xor i64 %8, -1
  %9 = load i64, ptr %x.addr, align 8
  %or7 = or i64 %not6, %9
  %10 = load i64, ptr %y.addr, align 8
  %11 = load i64, ptr %x.addr, align 8
  %sub8 = sub i64 %10, %11
  %and9 = and i64 %or7, %sub8
  %or10 = or i64 %and5, %and9
  %shr11 = lshr i64 %or10, 63
  store i64 %shr11, ptr %gt, align 8
  %12 = load i64, ptr %x.addr, align 8
  %shr12 = lshr i64 %12, 63
  store i64 %shr12, ptr %s, align 8
  %13 = load i64, ptr %x.addr, align 8
  %14 = load i64, ptr %y.addr, align 8
  %xor = xor i64 %13, %14
  %shr13 = lshr i64 %xor, 63
  %tobool = icmp ne i64 %shr13, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %15 = load i64, ptr %s, align 8
  %conv = trunc i64 %15 to i32
  store i32 %conv, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %16 = load i64, ptr %s, align 8
  %17 = load i64, ptr %gt, align 8
  %and14 = and i64 %16, %17
  %18 = load i64, ptr %s, align 8
  %xor15 = xor i64 %18, 1
  %19 = load i64, ptr %lt, align 8
  %and16 = and i64 %xor15, %19
  %or17 = or i64 %and14, %and16
  %conv18 = trunc i64 %or17 to i32
  store i32 %conv18, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %20 = load i32, ptr %retval, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @fpr_lt(i64 noundef 0, i64 noundef 0)
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
