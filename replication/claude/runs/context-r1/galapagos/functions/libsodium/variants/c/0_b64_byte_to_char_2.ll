; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_2.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %m26 = alloca i32, align 4
  %m52 = alloca i32, align 4
  %m62 = alloca i32, align 4
  %n62 = alloca i32, align 4
  %n63 = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shl = shl i32 %sub, 16
  %shr = lshr i32 %shl, 24
  store i32 %shr, ptr %m26, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shl2 = shl i32 %sub1, 16
  %shr3 = lshr i32 %shl2, 24
  store i32 %shr3, ptr %m52, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shl5 = shl i32 %sub4, 16
  %shr6 = lshr i32 %shl5, 24
  store i32 %shr6, ptr %m62, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %not = xor i32 %xor, -1
  %add = add i32 %not, 1
  %shl7 = shl i32 %add, 16
  %shr8 = lshr i32 %shl7, 24
  store i32 %shr8, ptr %n62, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor9 = xor i32 %4, 63
  %not10 = xor i32 %xor9, -1
  %add11 = add i32 %not10, 1
  %shl12 = shl i32 %add11, 16
  %shr13 = lshr i32 %shl12, 24
  store i32 %shr13, ptr %n63, align 4
  %5 = load i32, ptr %m26, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add14 = add i32 %6, 65
  %and = and i32 %5, %add14
  %7 = load i32, ptr %m26, align 4
  %xor15 = xor i32 %7, 255
  %8 = load i32, ptr %m52, align 4
  %and16 = and i32 %xor15, %8
  %9 = load i32, ptr %x.addr, align 4
  %add17 = add i32 %9, 71
  %and18 = and i32 %and16, %add17
  %or = or i32 %and, %and18
  %10 = load i32, ptr %m52, align 4
  %xor19 = xor i32 %10, 255
  %11 = load i32, ptr %m62, align 4
  %and20 = and i32 %xor19, %11
  %12 = load i32, ptr %x.addr, align 4
  %add21 = add i32 %12, -4
  %and22 = and i32 %and20, %add21
  %or23 = or i32 %or, %and22
  %13 = load i32, ptr %n62, align 4
  %xor24 = xor i32 %13, 255
  %and25 = and i32 %xor24, 43
  %or26 = or i32 %or23, %and25
  %14 = load i32, ptr %n63, align 4
  %xor27 = xor i32 %14, 255
  %and28 = and i32 %xor27, 47
  %or29 = or i32 %or26, %and28
  ret i32 %or29
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
