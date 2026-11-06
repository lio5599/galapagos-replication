; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_2.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %not = xor i32 %or, -1
  %shr = lshr i32 %not, 8
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 65
  %and = and i32 %shr, %sub2
  %and3 = and i32 %and, 255
  %4 = load i32, ptr %u, align 4
  %sub4 = sub i32 %4, 97
  %5 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %5
  %or6 = or i32 %sub4, %sub5
  %not7 = xor i32 %or6, -1
  %shr8 = lshr i32 %not7, 8
  %6 = load i32, ptr %u, align 4
  %sub9 = sub i32 %6, 71
  %and10 = and i32 %shr8, %sub9
  %and11 = and i32 %and10, 255
  %or12 = or i32 %and3, %and11
  %7 = load i32, ptr %u, align 4
  %sub13 = sub i32 %7, 48
  %8 = load i32, ptr %u, align 4
  %sub14 = sub i32 57, %8
  %or15 = or i32 %sub13, %sub14
  %not16 = xor i32 %or15, -1
  %shr17 = lshr i32 %not16, 8
  %9 = load i32, ptr %u, align 4
  %add = add i32 %9, 4
  %and18 = and i32 %shr17, %add
  %and19 = and i32 %and18, 255
  %or20 = or i32 %or12, %and19
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub21 = sub i32 0, %xor
  %shr22 = lshr i32 %sub21, 8
  %and23 = and i32 %shr22, 255
  %xor24 = xor i32 %and23, 255
  %and25 = and i32 %xor24, 62
  %or26 = or i32 %or20, %and25
  %11 = load i32, ptr %u, align 4
  %xor27 = xor i32 %11, 47
  %sub28 = sub i32 0, %xor27
  %shr29 = lshr i32 %sub28, 8
  %and30 = and i32 %shr29, 255
  %xor31 = xor i32 %and30, 255
  %and32 = and i32 %xor31, 63
  %or33 = or i32 %or26, %and32
  store i32 %or33, ptr %x, align 4
  %12 = load i32, ptr %x, align 4
  %cmp = icmp ne i32 %12, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %13 = load i32, ptr %x, align 4
  store i32 %13, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %14 = load i32, ptr %u, align 4
  %xor34 = xor i32 %14, 65
  %sub35 = sub i32 0, %xor34
  %shr36 = lshr i32 %sub35, 8
  %and37 = and i32 %shr36, 255
  store i32 %and37, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %15 = load i32, ptr %retval, align 4
  ret i32 %15
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
